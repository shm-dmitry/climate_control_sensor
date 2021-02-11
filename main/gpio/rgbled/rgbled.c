#include "rgbled.h"

#include "rgbled_api.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"

void rgbled_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	char * rgbs = cJSON_GetStringValue(cJSON_GetObjectItem(root, "rgb"));
	char* invptr = NULL;
	uint32_t rgb = strtol(rgbs, &invptr, 16);
	if (invptr == NULL) {
		rgbled_set_color(rgb);
	}

	cJSON_Delete(root);
}

void rgbled_startup(const rgbled_config_t * config, const char * command_topic) {
	if (rgbled_init(config)) {
		return;
	}

	mqtt_subscribe(command_topic, rgbled_commands);
}
