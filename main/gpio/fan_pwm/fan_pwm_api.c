#include "fan_pwm_api.h"

#include "fan_pwm_nvs.h"
#include "driver/ledc.h"
#include "../../log.h"

#define FAN_PWM_CHANNEL   LEDC_CHANNEL_3

esp_err_t fan_pwm_init(int gpio) {
    ledc_timer_config_t ledc_timer = {
        .duty_resolution = LEDC_TIMER_8_BIT, // resolution of PWM duty
        .freq_hz = 51200,                      // frequency of PWM signal
        .speed_mode = LEDC_LOW_SPEED_MODE,    // timer mode
        .timer_num = LEDC_TIMER_1,            // timer index
        .clk_cfg = LEDC_AUTO_CLK,             // Auto select the source clock
    };

    esp_err_t res = ledc_timer_config(&ledc_timer);
    if (res) {
    	ESP_LOGE(RGBLED_LOG, "ledc_timer_config error %d", res);
    	return res;
    }

    ledc_channel_config_t cfg = {
    	.channel    = FAN_PWM_CHANNEL,
        .duty       = 0,
        .gpio_num   = gpio,
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .hpoint     = 0,
        .timer_sel  = LEDC_TIMER_1
    };

	res = ledc_channel_config(&cfg);
	if (res) {
    	ESP_LOGE(RGBLED_LOG, "ledc_channel_config error %d for pin %d", res, gpio);
		return res;
	}

	return fan_pwm_set_percent(fan_pwm_nws_read());
}

esp_err_t fan_pwm_set_percent(uint8_t percent) {
	if (percent > 100) {
		percent = 100;
	}

	uint8_t value = (percent * 255) / 100;
	return ledc_set_duty(LEDC_LOW_SPEED_MODE, FAN_PWM_CHANNEL, value);
}
