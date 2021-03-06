#include "anemometer_api.h"

#include "anemometer_nvs.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"
#include "string.h"
#include <stdlib.h>
#include "../../log.h"

#define ANEMOMETER_MAX_COUNT_TO_RECALC 100
#define ANEMOMETER_MAX_TIME_PERIOD_TO_RECALC 10 // seconds
#define ANEMOMETER_LOG_DEBUGEVENTS false
#define ANEMOMETER_GPIO_LISTENER_STACK_SIZE 4096
#define ANEMOMETER_RECALC_LISTENER_STACK_SIZE 10240

typedef struct anemometer_internal_data_t {
	uint8_t direction;
	uint8_t counter;
	time_t started;
} anemometer_internal_data_t;

static xQueueHandle anemometer_gpio_evt_queue = NULL;
static xQueueHandle anemometer_recalc_data_queue = NULL;
static uint8_t anemometer_gpio_A = 0;
static uint8_t anemometer_gpio_B = 0;
static anemometer_callback_t anemometer_callback = NULL;
static anemometer_calibration_table_t * anemometer_calibration_data = NULL;

static anemometer_internal_data_t anemometer_data = {
	.direction = ANEMOMETER_DIRECTION_NO_MOVERMENT,
	.counter = 0,
	.started = 0
};

static void recalc_direction(uint8_t to) {
	if (anemometer_data.direction != to) {
		anemometer_data.direction = to;
		anemometer_data.counter = 0;
		time(&anemometer_data.started);
	} else {
		anemometer_data.counter++;

		time_t now;
		time(&now);
		if (anemometer_data.counter > ANEMOMETER_MAX_COUNT_TO_RECALC || now - anemometer_data.started > ANEMOMETER_MAX_TIME_PERIOD_TO_RECALC) {
			anemometer_internal_data_t * obj = (anemometer_internal_data_t *) malloc(sizeof(anemometer_internal_data_t));
			if (obj != NULL) {
				memcpy(obj, &anemometer_data, sizeof(anemometer_internal_data_t));
			}

			anemometer_data.direction = to;
			anemometer_data.counter = 0;
			time(&anemometer_data.started);

			if (obj != NULL) {
				obj->started = anemometer_data.started - obj->started;

#if ANEMOMETER_LOG_DEBUGEVENTS
				ESP_LOGI(ANEMOMETER_LOG, "Fire recalc event. Counter = %d, Time = %ld, Direction = %d", obj->counter, obj->started, obj->direction);
#endif

				xQueueSendFromISR(anemometer_recalc_data_queue, obj, NULL);

				free(obj);
				obj = NULL;
			}
		}
	}
}

static void IRAM_ATTR anemometer_gpio_isr_handler(void* arg) {
	uint32_t value = 0;
    xQueueSendFromISR(anemometer_gpio_evt_queue, &value, NULL);
}

static void anemometer_gpio_onchange_queue_listener(void* arg) {
	uint32_t temp;
    for(;;) {
        if(xQueueReceive(anemometer_gpio_evt_queue, &temp, portMAX_DELAY) == pdPASS) {
			uint8_t valueA = gpio_get_level(anemometer_gpio_A);
			uint8_t valueB = gpio_get_level(anemometer_gpio_B);

#if ANEMOMETER_LOG_DEBUGEVENTS
			ESP_LOGI(ANEMOMETER_LOG, "onValueChanged: A = %d, B = %d", valueA, valueB);
#endif

			if (valueA && !valueB) {
#if ANEMOMETER_LOG_DEBUGEVENTS
				ESP_LOGI(ANEMOMETER_LOG, "onValueChanged: added one step in direction#1");
#endif

				recalc_direction(ANEMOMETER_DIRECTION_1);
			} else if (!valueA && valueB) {
#if ANEMOMETER_LOG_DEBUGEVENTS
				ESP_LOGI(ANEMOMETER_LOG, "onValueChanged: added one step in direction#2");
#endif

				recalc_direction(ANEMOMETER_DIRECTION_2);
			}
        }
    }
}

static float anemometer_calculate_speed(float rps) {
	if (rps <= 0 || anemometer_calibration_data == NULL) {
		return ANEMOMETER_UNKNOWN_VALUE;
	}

	anemometer_calibration_table_row_t* rows = anemometer_calibration_data->rows;

	if (rps <= rows[1].rps) {
		if (rows[1].rps == 0) {
			return ANEMOMETER_UNKNOWN_VALUE;
		}

		return rps * rows[1].speed / rows[1].rps;
	} else {
		for (int i = 1; i<anemometer_calibration_data->rows_count; i++) {
			if (rps > rows[i - 1].rps && rps < rows[i].rps) {
				// interpolation - polinom^2
				// y = (y2 — y1) / (x2 — x1) * x + y1 — (y2 — y1) / (x2 — x1) * x1
				// y === speed
				// x === rps

				float dx = rows[i].rps - rows[i - 1].rps;
				if (dx <= 0) {
					return ANEMOMETER_UNKNOWN_VALUE;
				}

				float dy_dx = (rows[i].speed - rows[i - 1].speed) / dx;

				return dy_dx * rps + rows[i - 1].speed - dy_dx * rows[i - 1].rps;
			}
		}
	}

	// extrapolation - polinom^2 based on 2 last points
	// y = (y2 — y1) / (x2 — x1) * x + y1 — (y2 — y1) / (x2 — x1) * x1
	// y === speed
	// x === rps

	float x1 = rows[anemometer_calibration_data->rows_count - 2].rps;
	float x2 = rows[anemometer_calibration_data->rows_count - 1].rps;
	float y1 = rows[anemometer_calibration_data->rows_count - 2].speed;
	float y2 = rows[anemometer_calibration_data->rows_count - 1].speed;

	float dx = x2 - x1;
	if (dx <= 0) {
		return ANEMOMETER_UNKNOWN_VALUE;
	}

	float dy_dx = (y2 - y1) / dx;

	return dy_dx * rps + y1 - dy_dx * x1;
}

static float anemometer_calculate_consumption(float speed) {
	if (speed <= 0 || anemometer_calibration_data == NULL || anemometer_calibration_data->cross_sectional_area <= 0) {
		return ANEMOMETER_UNKNOWN_VALUE;
	}

	// anemometer_calibration_data->cross_sectional_area - in m^2
	// speed in m/s
	// result in m^3 / h

	return speed * anemometer_calibration_data->cross_sectional_area * 60 * 60;
}

static void anemometer_recalc_data_listener(void* arg) {
	anemometer_internal_data_t * temp = malloc(sizeof(anemometer_internal_data_t));
	if (temp == NULL) {
		ESP_LOGE(ANEMOMETER_LOG, "anemometer_recalc_data_listener - cant allocate memory");
		return;
	}

    for(;;) {
    	memset(temp, 0, sizeof(anemometer_internal_data_t));

        if(xQueueReceive(anemometer_recalc_data_queue, temp, portMAX_DELAY) == pdPASS) {
        	if (temp == NULL) {
        		continue;
        	}

        	ESP_LOGI(ANEMOMETER_LOG, "Recalc event received. Counter = %d, Time = %ld, Direction = %d", temp->counter, temp->started, temp->direction);

        	anemometer_data_t result;

        	time_t now;
        	time(&now);

        	if (temp->counter == 0 || temp->started == 0) {
        		result.direction = ANEMOMETER_DIRECTION_NO_MOVERMENT;
        		result.updated = now;

        		result.raw_rps = 0;

        		result.speed = 0;
        		result.consumption = 0;
        	} else {
        		result.direction = temp->direction;
        		result.updated = now;

        		result.raw_rps = ((float) temp->counter) / ((float) temp->started);

        		result.speed = anemometer_calculate_speed(result.raw_rps);
        		result.consumption = anemometer_calculate_consumption(result.speed);
        	}

        	ESP_LOGI(ANEMOMETER_LOG, "Anemometer event: direction = %d, updated = %ld, rps = %f, speed = %f, consumption = %f", result.direction, result.updated, result.raw_rps, result.speed, result.consumption);

        	anemometer_callback(&result);
        }
    }
}

esp_err_t anemometer_init(int gpio_A, int gpio_B, anemometer_callback_t callback) {
	gpio_config_t config = {
		.intr_type = GPIO_INTR_POSEDGE,
		.pin_bit_mask = (1ULL << gpio_A) | (1ULL << gpio_B),
		.mode = GPIO_MODE_INPUT,
		.pull_down_en = GPIO_PULLDOWN_DISABLE,
		.pull_up_en = GPIO_PULLUP_DISABLE
	};

	esp_err_t res = gpio_config(&config);
	if (res) {
		ESP_LOGE(ANEMOMETER_LOG, "gpio_config error: %d. A = %d, B = %d", res, gpio_A, gpio_B);
		return res;
	}

	res = gpio_set_intr_type(gpio_A, GPIO_INTR_POSEDGE);
	if (res) {
		ESP_LOGE(ANEMOMETER_LOG, "gpio_set_intr_type A error: %d", res);
		return res;
	}

	res = gpio_set_intr_type(gpio_B, GPIO_INTR_POSEDGE);
	if (res) {
		ESP_LOGE(ANEMOMETER_LOG, "gpio_set_intr_type B error: %d", res);
		return res;
	}

	anemometer_callback = callback;

	anemometer_gpio_A = gpio_A;
	anemometer_gpio_B = gpio_B;

	anemometer_calibration_data = anemometer_nvs_restore_settings();

	anemometer_gpio_evt_queue = xQueueCreate(30, sizeof(uint32_t));
	xTaskCreate(anemometer_gpio_onchange_queue_listener, "onchange gpio listener", ANEMOMETER_GPIO_LISTENER_STACK_SIZE, NULL, 10, NULL);

	anemometer_recalc_data_queue = xQueueCreate(10, sizeof(anemometer_internal_data_t));
	xTaskCreate(anemometer_recalc_data_listener, "recalc data listener", ANEMOMETER_RECALC_LISTENER_STACK_SIZE, NULL, 10, NULL);

	res = gpio_install_isr_service(0);
	if (res) {
		ESP_LOGE(ANEMOMETER_LOG, "gpio_install_isr_service error: %d", res);
		return res;
	}

    res = gpio_isr_handler_add(anemometer_gpio_A, anemometer_gpio_isr_handler, &anemometer_gpio_A);
	if (res) {
		ESP_LOGE(ANEMOMETER_LOG, "gpio_isr_handler_add A error: %d", res);
		return res;
	}

    res = gpio_isr_handler_add(anemometer_gpio_B, anemometer_gpio_isr_handler, &anemometer_gpio_B);
	if (res) {
		ESP_LOGE(ANEMOMETER_LOG, "gpio_isr_handler_add B error: %d", res);
		return res;
	}

	ESP_LOGI(ANEMOMETER_LOG, "Driver initialied");

	return ESP_OK;
}

int anemometer_calibration_rows_comparator(const void* a, const void* b) {
	return ((anemometer_calibration_table_row_t*) a)->rps - ((anemometer_calibration_table_row_t*) b)->rps;
}

void anemometer_calibrate(anemometer_calibration_table_t * table) {
	anemometer_calibration_table_t* temp = NULL;

	if (table != NULL && table->rows_count > 1 && table->rows_count <= ANEMOMETER_CALIBRATION_MAXROWS) {
		temp = (anemometer_calibration_table_t *)malloc(sizeof(anemometer_calibration_table_t));
		if (temp != NULL) {
			temp->rows = (anemometer_calibration_table_row_t*) malloc(sizeof(anemometer_calibration_table_row_t) * table->rows_count);
			if (temp->rows != NULL) {
				memcpy(temp->rows, table->rows, sizeof(anemometer_calibration_table_row_t) * table->rows_count);
				temp->rows_count = table->rows_count;
				temp->cross_sectional_area = table->cross_sectional_area > 0 ? table->cross_sectional_area : ANEMOMETER_UNKNOWN_VALUE;

				qsort(temp->rows, temp->rows_count, sizeof(anemometer_calibration_table_row_t), anemometer_calibration_rows_comparator);
			} else {
				free(temp);
				temp = NULL;
			}
		}
	} else {
		ESP_LOGI(ANEMOMETER_LOG, "No data provided for calibration: table == %p, table.rows_count == %d", table, (table == NULL ? 0 : table->rows_count));
	}

	anemometer_nvs_save_settings(temp);

	if (anemometer_calibration_data != NULL) {
		if (anemometer_calibration_data ->rows != NULL) {
			free(anemometer_calibration_data->rows);
		}
		free(anemometer_calibration_data);
		anemometer_calibration_data = NULL;
	}

	anemometer_calibration_data = temp;
}
