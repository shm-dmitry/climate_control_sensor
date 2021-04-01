#include "fan_api.h"

#include "driver/gpio.h"

#include "../../log.h"

#define FAN_NOT_INITIALIZED 0xFFFF

int fan_gpio = FAN_NOT_INITIALIZED;

esp_err_t fan_init(int gpio) {
	gpio_config_t config = {
		.intr_type = GPIO_INTR_DISABLE,
	    .mode = GPIO_MODE_OUTPUT,
		.pin_bit_mask = 1ULL << gpio,
		.pull_down_en = GPIO_PULLDOWN_ENABLE,
		.pull_up_en = GPIO_PULLUP_DISABLE,
	};

	esp_err_t res = gpio_config(&config);
	if (res) {
		ESP_LOGI(FAN_LOG, "Cant init GPIO. error %d", res);
		return res;
	}

	ESP_LOGI(FAN_LOG, "Driver initialied.");

	fan_gpio = gpio;

	fan_stop();

	return ESP_OK;
}

esp_err_t fan_start() {
	if (fan_gpio == FAN_NOT_INITIALIZED) {
		ESP_LOGE(FAN_LOG, "Driver not initialized.");
		return ESP_ERR_INVALID_STATE;
	}

	esp_err_t res = gpio_set_level(fan_gpio, 1);
	if (res) {
		ESP_LOGE(FAN_LOG, "Cant set HIGH level on pin %d: %d", fan_gpio, res);
	} else {
		ESP_LOGI(FAN_LOG, "HIGH level on pin %d activated.", fan_gpio);
	}

	return res;
}

esp_err_t fan_stop() {
	if (fan_gpio == FAN_NOT_INITIALIZED) {
		ESP_LOGE(FAN_LOG, "Driver not initialized.");
		return ESP_ERR_INVALID_STATE;
	}

	esp_err_t res = gpio_set_level(fan_gpio, 0);
	if (res) {
		ESP_LOGE(FAN_LOG, "Cant set LOW level on pin %d: %d", fan_gpio, res);
	} else {
		ESP_LOGI(FAN_LOG, "LOW level on pin %d activated.", fan_gpio);
	}

	return res;
}
