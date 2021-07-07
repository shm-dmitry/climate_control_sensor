#include "fan.h"

#include "fan_api.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"
#include "../../init/init_logger.h"

#define FAN_CHANGE_STATUS_ENABLED  1
#define FAN_CHANGE_STATUS_DISABLED 0
#define FAN_CHANGE_STATUS_NOT_SET  2

void fan_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	uint8_t state = get_boolean_from_json(cJSON_GetObjectItem(root, "state"), FAN_CHANGE_STATUS_ENABLED, FAN_CHANGE_STATUS_DISABLED, FAN_CHANGE_STATUS_NOT_SET);

	if (state == FAN_CHANGE_STATUS_ENABLED) {
		fan_start();
	} else if (state == FAN_CHANGE_STATUS_DISABLED) {
		fan_stop();
	}

	cJSON_Delete(root);
}

void fan_startup(int gpio, const char * command_topic) {
	INIT_DRIVER_AND_LOG_OR_RETURN(fan_init(gpio), "FAN driver initialized", "Cant initialize FAN driver: %d");

	mqtt_subscribe(command_topic, fan_commands);
}
