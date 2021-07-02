#include "fan_pwm.h"

#include "fan_pwm_api.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"

#define FAN_PWM_NOCHANGE 250

void fan_pwm_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	uint8_t percent = get_number8_from_json(cJSON_GetObjectItem(root, "percent"), FAN_PWM_NOCHANGE);
	if (percent != FAN_PWM_NOCHANGE) {
		fan_pwm_set_percent(percent);
	}

	cJSON_Delete(root);
}

void fan_pwm_startup(int gpio, const char * command_topic) {
	if (fan_pwm_init(gpio)) {
		return;
	}

	mqtt_subscribe(command_topic, fan_pwm_commands);
}
