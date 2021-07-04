#include "fan_pwm_api.h"

#include "fan_pwm_nvs.h"
#include "driver/ledc.h"
#include "../../log.h"

#define FAN_PWM_CHANNEL   LEDC_CHANNEL_3
#define FAN_PWM_TIMER     LEDC_TIMER_2
#define FAN_PWM_SPEED     LEDC_LOW_SPEED_MODE
#define FAN_PWM_FREQ      4

esp_err_t fan_pwm_init(int gpio) {
    ledc_timer_config_t ledc_timer = {
		.duty_resolution = LEDC_TIMER_8_BIT, // resolution of PWM duty
		.freq_hz = FAN_PWM_FREQ,             // frequency of PWM signal
		.speed_mode = FAN_PWM_SPEED,         // timer mode
		.timer_num = FAN_PWM_TIMER,          // timer index
		.clk_cfg = LEDC_AUTO_CLK,            // Auto select the source clock
    };

    esp_err_t res = ledc_timer_config(&ledc_timer);
    if (res) {
    	ESP_LOGE(FAN_PWM_LOG, "ledc_timer_config error %d", res);
    	return res;
    }

    ledc_channel_config_t cfg = {
		.channel    = FAN_PWM_CHANNEL,
		.duty       = 0,
		.gpio_num   = gpio,
		.speed_mode = FAN_PWM_SPEED,
		.hpoint     = 0,
		.timer_sel  = FAN_PWM_TIMER
    };

	res = ledc_channel_config(&cfg);
	if (res) {
    	ESP_LOGE(FAN_PWM_LOG, "ledc_channel_config error %d for pin %d", res, gpio);
		return res;
	}

	res = ledc_fade_func_install(0);
	if (res) {
    	ESP_LOGE(RGBLED_LOG, "ledc_fade_func_install error %d", res);
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

	uint8_t value = (percent * 255) / 100;
	esp_err_t res = ledc_set_duty(FAN_PWM_SPEED, FAN_PWM_CHANNEL, value);
	if (res) {
		ESP_LOGE(FAN_PWM_LOG, "set duty :: ledc_set_duty() error %d", res);
		return res;
	}


	res = ledc_update_duty(FAN_PWM_SPEED, FAN_PWM_CHANNEL);
	if (res) {
		ESP_LOGE(FAN_PWM_LOG, "change duty :: ledc_update_duty() error %d", res);
		return res;
	}

	ESP_LOGI(FAN_PWM_LOG, "Duty changed to %d", value);

	return res;
}
