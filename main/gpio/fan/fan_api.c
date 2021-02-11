#include "fan_api.h"

#include "driver/gpio.h"

#define FAN_NOT_INITIALIZED 0xFFFF

int fan_gpio = FAN_NOT_INITIALIZED;

esp_err_t fan_init(int gpio) {
	gpio_config_t config = {
		.intr_type = GPIO_INTR_DISABLE,
	    .mode = GPIO_MODE_OUTPUT,
		.pin_bit_mask = 1 << gpio,
		.pull_down_en = GPIO_PULLDOWN_ENABLE,
		.pull_up_en = GPIO_PULLUP_DISABLE,
	};

	esp_err_t res = gpio_config(&config);
	if (res) {
		return res;
	}

	fan_gpio = gpio;

	gpio_set_level(fan_gpio, 0);

	return ESP_OK;
}

esp_err_t fan_start() {
	if (fan_gpio == FAN_NOT_INITIALIZED) {
		return ESP_ERR_INVALID_STATE;
	}

	return gpio_set_level(fan_gpio, 1);
}

esp_err_t fan_stop() {
	if (fan_gpio == FAN_NOT_INITIALIZED) {
		return ESP_ERR_INVALID_STATE;
	}

	return gpio_set_level(fan_gpio, 0);
}
