#include "fan_pwm_api.h"

#include "fan_pwm_nvs.h"
#include "../../log.h"

#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

static int fan_pwm_gpio = -1;
static TaskHandle_t fan_pwm_task_handle = NULL;

#define FAN_PWM_HIGL_LEVEL_TIME 500
#define FAN_PWM_LOW_LEVEL_CALC(percent) ((uint32_t)((FAN_PWM_HIGL_LEVEL_TIME * ( 100 - percent )) / percent))

static void fan_pwm_task(void* arg) {
	uint32_t low_time = (uint32_t) arg;

	while (true) {
		esp_err_t res = gpio_set_level(fan_pwm_gpio, 1);
		if (res) {
			ESP_LOGE(FAN_LOG, "Cant set HIGH level on pin %d: %d", fan_pwm_gpio, res);
			fan_pwm_task_handle = NULL;
			vTaskDelete(NULL);
		}

		vTaskDelay(FAN_PWM_HIGL_LEVEL_TIME / portTICK_PERIOD_MS);

		res = gpio_set_level(fan_pwm_gpio, 0);
		if (res) {
			ESP_LOGE(FAN_LOG, "Cant set LOW level on pin %d: %d", fan_pwm_gpio, res);
			fan_pwm_task_handle = NULL;
			vTaskDelete(NULL);
		}

		vTaskDelay(low_time / portTICK_PERIOD_MS);
	}
}

esp_err_t fan_pwm_init(int gpio) {
	fan_pwm_gpio = gpio;

	gpio_config_t config = {
		.intr_type = GPIO_INTR_DISABLE,
	    .mode = GPIO_MODE_OUTPUT,
		.pin_bit_mask = 1ULL << gpio,
		.pull_down_en = GPIO_PULLDOWN_ENABLE,
		.pull_up_en = GPIO_PULLUP_DISABLE,
	};

	esp_err_t res = gpio_config(&config);
	if (res) {
		ESP_LOGI(FAN_PWM_LOG, "Cant init GPIO. error %d", res);
		return res;
	}

	ESP_LOGI(FAN_PWM_LOG, "Driver initialized on port %d", gpio);

	fan_pwm_set_percent(fan_pwm_nws_read());

	return ESP_OK;
}

esp_err_t fan_pwm_set_percent(uint8_t percent) {
	if (percent > 100) {
		percent = 100;
	}

	fan_pwm_nws_write(percent);

	if (fan_pwm_task_handle) {
		vTaskDelete(fan_pwm_task_handle);
		fan_pwm_task_handle = NULL;
	}

	if (percent == 100) {
		esp_err_t res = gpio_set_level(fan_pwm_gpio, 1);
		if (res) {
			ESP_LOGE(FAN_LOG, "Cant set HIGH level on pin %d: %d", fan_pwm_gpio, res);
		} else {
			ESP_LOGI(FAN_LOG, "HIGH level on pin %d activated.", fan_pwm_gpio);
		}

		return res;
	} else {
		esp_err_t res = gpio_set_level(fan_pwm_gpio, 0);
		if (res) {
			ESP_LOGE(FAN_LOG, "Cant set LOW level on pin %d: %d", fan_pwm_gpio, res);
		} else {
			ESP_LOGI(FAN_LOG, "HIGH level on pin %d activated.", fan_pwm_gpio);
		}
	}

	if (percent > 0) {
		uint32_t low_time = FAN_PWM_LOW_LEVEL_CALC(percent);

		xTaskCreate(fan_pwm_task, "fan_pwm running task", 1024, (void *) low_time, 10, &fan_pwm_task_handle);
	}

	return ESP_OK;
}
