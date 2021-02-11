#include "ttp223.h"

#include "ttp223_api.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"
#include "../rgbled/rgbled_api.h"
#include "string.h"

#define TTP223_ON_KEY_DOWN_COLOR 0x00FFFFFF

static char* ttp223_status_topic;

void ttp223_on_state_changed(uint8_t state) {
	if (state == TTP223_ON_KEY_DOWN) {
		rgbled_set_override_color(TTP223_ON_KEY_DOWN_COLOR);
	} else {
		rgbled_reset_override_color();

		cJSON *root = cJSON_CreateObject();

		cJSON_AddBoolToObject(root, "on_key_up", 1);

		char * json = cJSON_Print(root);
		mqtt_publish(ttp223_status_topic, json);
		cJSON_free(json);

		cJSON_Delete(root);
	}
}

void ttp223_startup(int gpio, const char * status_topic) {
	if (ttp223_init(gpio, ttp223_on_state_changed)) {
		return;
	}

	ttp223_status_topic = malloc(strlen(status_topic) + 1);
	memcpy(ttp223_status_topic, status_topic, strlen(status_topic) + 1);
}
