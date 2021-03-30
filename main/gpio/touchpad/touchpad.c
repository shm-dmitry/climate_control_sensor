#include "touchpad.h"

#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"
#include "../rgbled/rgbled_api.h"
#include "string.h"
#include "touchpad_api.h"

#define TOUCHPAD_ON_KEY_DOWN_COLOR 0x00FFFFFF
static char* touchpad_status_topic = NULL;

void touchpad_callback_func(uint8_t state) {
	if (state == TOUCHPAD_ON_KEY_DOWN) {
		rgbled_set_override_color(TOUCHPAD_ON_KEY_DOWN_COLOR);
	} else {
		rgbled_reset_override_color();
	}


	cJSON *root = cJSON_CreateObject();

	if (state == TOUCHPAD_ON_KEY_DOWN) {
		cJSON_AddStringToObject(root, "value", "on_key_down");
	} else if (state == TOUCHPAD_ON_KEY_UP) {
		cJSON_AddStringToObject(root, "value", "on_key_up");
	} else {
		cJSON_AddStringToObject(root, "value", "idle");
	}

	char * json = cJSON_Print(root);
	mqtt_publish(touchpad_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);
}

esp_err_t touchpad_init(touch_pad_t pad, const char* status_topic) {
	esp_err_t res = touchpad_setup(pad, touchpad_callback_func);
	if (res) {
		return res;
	}


	touchpad_status_topic = malloc(strlen(status_topic) + 1);
	memcpy(touchpad_status_topic, status_topic, strlen(status_topic) + 1);

	return ESP_OK;
}
