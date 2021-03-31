#include "touchpad_api.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/touch_pad.h"
#include "soc/rtc_periph.h"
#include "soc/sens_periph.h"

#include "../../log.h"

// based on https://github.com/espressif/esp-idf/blob/master/examples/peripherals/touch_pad_interrupt/main/esp32/tp_interrupt_main.c

#define TOUCHPAD_THRESH_NO_USE   (0)
#define TOUCHPAD_FILTER_TOUCH_PERIOD (10)
#define TOUCHPAD_THRESHOLD_CALC(value) ((value) * 8) / 10
#define TOUCHPAD_LOG_VALUES false

#define TOUCHPAD_ERROR        0xFF

static touch_pad_t touchpad_index;
static touchpad_callback_t touchpad_callback = NULL;
static volatile uint16_t touchpad_threshold = 0;
static volatile uint32_t touchpad_calibration_val = 0;
static volatile uint8_t touchpad_calibration_cnt = 0;


static void touchpad_process_autocalibration(uint16_t value, bool untouched) {
	if (untouched) {
		touchpad_calibration_val += value;
		touchpad_calibration_cnt ++;

		if (touchpad_calibration_cnt >= 100) {
			touchpad_threshold = TOUCHPAD_THRESHOLD_CALC(touchpad_calibration_val / touchpad_calibration_cnt);
			touchpad_calibration_val = 0;
			touchpad_calibration_cnt = 0;

#if TOUCHPAD_LOG_VALUES
			ESP_LOGI(TOUCH_LOG, "Recalibrated to %d", touchpad_threshold);
#endif
		}
	} else {
		touchpad_calibration_val = 0;
		touchpad_calibration_cnt = 0;
	}
}

static uint8_t touchpad_read_value() {
	uint16_t value = 0;
	esp_err_t res = touch_pad_read_filtered(touchpad_index, &value);
	if (res) {
		return TOUCHPAD_ERROR;
	}

#if TOUCHPAD_LOG_VALUES
	ESP_LOGI(TOUCH_LOG, "touch_pad_read_filtered == %d", value);
#endif

	if (value > touchpad_threshold) {
		touchpad_process_autocalibration(value, true);
		return TOUCHPAD_ON_KEY_UP;
	} else {
		touchpad_process_autocalibration(value, false);
		return TOUCHPAD_ON_KEY_DOWN;
	}
}

static void touchpad_listener(void* arg) {
	uint8_t last_touchpad_pressed = TOUCHPAD_IDLE;
	uint8_t click_index = 0;
	for (;;) {
		if (last_touchpad_pressed == TOUCHPAD_IDLE) {
			vTaskDelay(50 / portTICK_PERIOD_MS);
		} else if (last_touchpad_pressed == TOUCHPAD_ON_KEY_DOWN) {
			vTaskDelay(100 / portTICK_PERIOD_MS);
		} else {
			vTaskDelay(200 / portTICK_PERIOD_MS);
		}

		uint8_t touchpad_pressed = touchpad_read_value();
		if (touchpad_pressed == TOUCHPAD_ERROR) {
			continue;
		}

		if (last_touchpad_pressed == TOUCHPAD_IDLE) {
			if (touchpad_pressed == TOUCHPAD_ON_KEY_UP) {
				// do nothing, idle mode
			} else {
				click_index = 1;

				last_touchpad_pressed = TOUCHPAD_ON_KEY_DOWN;
				touchpad_callback(TOUCHPAD_ON_KEY_DOWN, click_index);
			}
		} else if (last_touchpad_pressed == TOUCHPAD_ON_KEY_DOWN) {
			if (touchpad_pressed == TOUCHPAD_ON_KEY_UP) {
				last_touchpad_pressed = TOUCHPAD_ON_KEY_UP;
				touchpad_callback(TOUCHPAD_ON_KEY_UP, click_index);
			} else {
				// do nothing, key-down mode
			}
		} else if (last_touchpad_pressed == TOUCHPAD_ON_KEY_UP) {
			if (touchpad_pressed == TOUCHPAD_ON_KEY_UP) {
				last_touchpad_pressed = TOUCHPAD_IDLE;
				touchpad_callback(TOUCHPAD_IDLE, 0);
			} else {
				click_index++;

				last_touchpad_pressed = TOUCHPAD_ON_KEY_DOWN;
				touchpad_callback(TOUCHPAD_ON_KEY_DOWN, click_index);
			}
		}
	}
}

esp_err_t touchpad_setup(touch_pad_t pad, touchpad_callback_t callback) {
	touchpad_index = pad;
	touchpad_callback = callback;

	esp_err_t res = touch_pad_init();
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_init error %d", res);
		return res;
	}

	res = touch_pad_set_fsm_mode(TOUCH_FSM_MODE_TIMER);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_set_fsm_mode error %d", res);
		return res;
	}

	res = touch_pad_set_voltage(TOUCH_HVOLT_2V7, TOUCH_LVOLT_0V5, TOUCH_HVOLT_ATTEN_1V);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_set_voltage error %d", res);
		return res;
	}

	res = touch_pad_config(pad, TOUCHPAD_THRESH_NO_USE);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_config error %d", res);
		return res;
	}

	res = touch_pad_filter_start(TOUCHPAD_FILTER_TOUCH_PERIOD);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_filter_start error %d", res);
		return res;
	}

	uint16_t touch_value = 0;
	res = touch_pad_read_filtered(pad, &touch_value);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_read_filtered error %d", res);
		return res;
	}

	ESP_LOGI(TOUCH_LOG, "touch_pad_read_filtered: readed value %d", touch_value);
	touchpad_threshold = TOUCHPAD_THRESHOLD_CALC(touch_value);

	xTaskCreate(touchpad_listener, "on touch pad listener", 2048, NULL, 10, NULL);

	return ESP_OK;
}
