#include "fan_pwm.h"

#include "fan_pwm_api.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"
#include "../../init/init_logger.h"

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
	INIT_DRIVER_AND_LOG_OR_RETURN(fan_pwm_init(gpio), "FAN PWM driver initialized.", "Cant initlize FAN PWM driver: %d");

	mqtt_subscribe(command_topic, fan_pwm_commands);
}
