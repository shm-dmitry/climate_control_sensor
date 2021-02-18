#include "rgbled_api.h"

#include "driver/ledc.h"

#define RGBLED_RED   LEDC_CHANNEL_0
#define RGBLED_GREEN LEDC_CHANNEL_1
#define RGBLED_BLUE  LEDC_CHANNEL_2

#define RGBLED_NO_OVERRIDE_COLOR 0xFFFFFFFF
#define RGBLED_NOT_INITIALIZED 0xFEFFFFFF

static uint32_t rgbled_color = RGBLED_NOT_INITIALIZED;
static uint32_t rgbled_override_color = RGBLED_NO_OVERRIDE_COLOR;

esp_err_t rgbled_change_color();

esp_err_t rgbled_init(const rgbled_config_t * config) {
    ledc_timer_config_t ledc_timer = {
        .duty_resolution = LEDC_TIMER_16_BIT, // resolution of PWM duty
        .freq_hz = 5000,                      // frequency of PWM signal
        .speed_mode = LEDC_LOW_SPEED_MODE,    // timer mode
        .timer_num = LEDC_TIMER_1,            // timer index
        .clk_cfg = LEDC_AUTO_CLK,             // Auto select the source clock
    };

    esp_err_t res = ledc_timer_config(&ledc_timer);
    if (res) {
    	return res;
    }

    ledc_channel_config_t cfg = {
    	.channel    = RGBLED_RED,
        .duty       = 0,
        .gpio_num   = config->gpio_red,
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .hpoint     = 0,
        .timer_sel  = LEDC_TIMER_1
    };

    res = ledc_channel_config(&cfg);
    if (res) {
    	return res;
    }

    cfg.channel = RGBLED_GREEN;
    cfg.gpio_num   = config->gpio_green;

	res = ledc_channel_config(&cfg);
	if (res) {
		return res;
	}

    cfg.channel = RGBLED_BLUE;
    cfg.gpio_num   = config->gpio_blue;

	res = ledc_channel_config(&cfg);
	if (res) {
		return res;
	}

	res = ledc_fade_func_install(9);
	if (res) {
		return res;
	}

	rgbled_color = 0x0;
	rgbled_override_color = RGBLED_NO_OVERRIDE_COLOR;

	return rgbled_change_color();
}

esp_err_t rgbled_change_color() {
	uint32_t rgb = (rgbled_override_color == RGBLED_NO_OVERRIDE_COLOR) ? rgbled_color : rgbled_override_color;

	uint8_t r = (rgb >> 16) & 0xFF;
	uint8_t g = (rgb >> 8) & 0xFF;
	uint8_t b = rgb & 0xFF;

	esp_err_t res = ledc_set_duty(LEDC_LOW_SPEED_MODE, RGBLED_RED, r);
	if (res) {
		return res;
	}

	res = ledc_update_duty(LEDC_LOW_SPEED_MODE, RGBLED_RED);
	if (res) {
		return res;
	}

	res = ledc_set_duty(LEDC_LOW_SPEED_MODE, RGBLED_GREEN, g);
	if (res) {
		return res;
	}

	res = ledc_update_duty(LEDC_LOW_SPEED_MODE, RGBLED_GREEN);
	if (res) {
		return res;
	}

	res = ledc_set_duty(LEDC_LOW_SPEED_MODE, RGBLED_BLUE, b);
	if (res) {
		return res;
	}

	res = ledc_update_duty(LEDC_LOW_SPEED_MODE, RGBLED_BLUE);
	if (res) {
		return res;
	}

	return ESP_OK;
}

esp_err_t rgbled_set_color(uint32_t rgb) {
	if (rgbled_color == RGBLED_NOT_INITIALIZED) {
		return ESP_ERR_INVALID_STATE;
	}

	rgbled_color = rgb & 0x00FFFFFF;

	return rgbled_change_color();
}

esp_err_t rgbled_set_override_color(uint32_t rgb) {
	if (rgbled_color == RGBLED_NOT_INITIALIZED) {
		return ESP_ERR_INVALID_STATE;
	}

	rgbled_override_color = rgb & 0x00FFFFFF;

	return rgbled_change_color();
}

esp_err_t rgbled_reset_override_color() {
	if (rgbled_color == RGBLED_NOT_INITIALIZED) {
		return ESP_ERR_INVALID_STATE;
	}

	rgbled_override_color = RGBLED_NO_OVERRIDE_COLOR;

	return rgbled_change_color();
}
