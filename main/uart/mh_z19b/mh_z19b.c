#include "mh_z19b.h"

#include "mh_z19b.h"

#include "mh_z19b_api.h"
#include "string.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"

static char* mh_z19b_status_topic = NULL;

#define MH_Z19B_EXEC_PERIOD 10000000

void mh_z19b_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	char * type = cJSON_GetStringValue(cJSON_GetObjectItem(root, "type"));
	if (strcmp(type, "autocalibrate") == 0) {
		uint8_t value = get_boolean_from_json(cJSON_GetObjectItem(root, "enabled"), 1, 0, 2);
		if (value == 1 || value == 0) {
			mh_z19b_autocalibrate(value == 1);
		}
	} else if (strcmp(type, "calibrate_zero") == 0) {
		mh_z19b_calibrate(0);
	} else if (strcmp(type, "calibrate_span") == 0) {
		uint16_t value = get_number16_from_json(cJSON_GetObjectItem(root, "co2"), 0xFFFF);
		if (value != 0xFFFF) {
			mh_z19b_calibrate(value);
		}
	}
}

void mh_z19b_timer_exec_function(void* arg) {
	mh_z19b_data_t data = { 0 };
	if (mh_z19b_read(&data)) {
		return;
	}

	cJSON *root = cJSON_CreateObject();
	cJSON_AddNumberToObject(root, "co2", data.co2);
	cJSON_AddNumberToObject(root, "min_co2", data.min_co2);
	cJSON_AddNumberToObject(root, "temperature", data.temperature);
	cJSON_AddNumberToObject(root, "accuracy", data.accuracy);

	char * json = cJSON_Print(root);
	mqtt_publish(mh_z19b_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);

}

void mh_z19b_init(const uart_config_def_t * config, const char * status_topic, const char * command_topic) {
	if (mh_z19b_init_driver(config, MHZ19B_RANGE_3000)) {
		return;
	}

	mh_z19b_status_topic = malloc(strlen(status_topic) + 1);
	memset(mh_z19b_status_topic, 0, strlen(status_topic) + 1);
	memcpy(mh_z19b_status_topic, status_topic, strlen(status_topic) + 1);

	mqtt_subscribe(command_topic, mh_z19b_commands);

	esp_timer_create_args_t periodic_timer_args = {
			.callback = &mh_z19b_timer_exec_function,
			/* name is optional, but may help identify the timer when debugging */
			.name = "periodic"
	};

	esp_timer_handle_t periodic_timer;
	ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
	ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, MH_Z19B_EXEC_PERIOD));

}
