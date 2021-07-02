#include "fan_pwm_nvs.h"

#include "../../init/nvs_rw.h"

#define FAN_PWM_NVS_NAME "fan_pwm_value"
#define DEFAULT_FAN_PWM_VALUE 0

uint8_t fan_pwm_nws_read() {
	size_t buffer_size = 0;
	uint8_t * buffer = NULL;

	esp_err_t res = nvs_read_buffer(FAN_PWM_NVS_NAME, &buffer, &buffer_size);
	if (res == ESP_OK) {
		uint8_t res = DEFAULT_FAN_PWM_VALUE;

		if (buffer_size == 1 && buffer) {
			res = buffer[0];
		}

		if (buffer) {
			free(buffer);
		}

		return res;
	} else {
		return DEFAULT_FAN_PWM_VALUE;
	}
}

void fan_pwm_nws_write(uint8_t value) {
	nvs_write_buffer(FAN_PWM_NVS_NAME, &value, 1);
}
