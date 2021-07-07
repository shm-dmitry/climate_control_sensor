#include "tion_bt.h"

#include "../log.h"
#include "../init/mqtt.h"
#include "../init/init_logger.h"
#include "../cjson/cjson_helper.h"
#include "tion_bt.h"

#include "string.h"

#include "esp_timer.h"

static char * tion_status_topic = NULL;

#define TION_EXEC_PERIOD 15*60*100000

void tion_status_callback(tion_status_t * status) {
	cJSON *root = cJSON_CreateObject();
	cJSON_AddNumberToObject(root, "fan_spped", status->fan_spped);
	cJSON_AddNumberToObject(root, "mode", status->mode);
	cJSON_AddBoolToObject(root, "heater", status->heater);
	cJSON_AddBoolToObject(root, "state", status->state);
	cJSON_AddNumberToObject(root, "target_temperature", status->target_temperature);
	cJSON_AddBoolToObject(root, "sound", status->sound);
	cJSON_AddNumberToObject(root, "outdoor_temperature", status->outdoor_temperature);
	cJSON_AddNumberToObject(root, "indoor_temperature", status->indoor_temperature);
	cJSON_AddNumberToObject(root, "filter_remain", status->filter_remain);
	cJSON_AddNumberToObject(root, "error_code", status->error_code);
	cJSON_AddBoolToObject(root, "timer", status->timer);
	cJSON_AddNumberToObject(root, "time", status->time);
	cJSON_AddNumberToObject(root, "productivity", status->productivity);
	cJSON_AddNumberToObject(root, "fw_version", status->fw_version);

	char cs[12] = { 0 };
	snprintf(cs, 12, "%d", status->check_sum);
	cJSON_AddStringToObject(root, "check_sum", cs);

	char date[25] = { 0 };
	struct tm * timeinfo = localtime(&status->updated);
	strftime(date, 25, "%Y-%m-%d %H:%M:%S", timeinfo);

	cJSON_AddStringToObject(root, "updated", date);

	char * json = cJSON_Print(root);
	mqtt_publish(tion_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);
}

void tion_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	char * type = cJSON_GetStringValue(cJSON_GetObjectItem(root, "type"));
	if (strcmp(type, "pair") == 0) {
		tion_bt_pair();
	} else {
		tion_change_status_t status = {
			.fan_speed = get_number8_from_json(cJSON_GetObjectItem(root, "fan_speed"), TION_CHANGE_STATUS_NOT_SET),
			.target_temperature = get_number8_from_json(cJSON_GetObjectItem(root, "target_temperature"), TION_CHANGE_STATUS_NOT_SET),
			.mode = get_number8_from_json(cJSON_GetObjectItem(root, "mode"), TION_CHANGE_STATUS_NOT_SET),
			.heater = get_boolean_from_json(cJSON_GetObjectItem(root, "heater"), TION_CHANGE_STATUS_TRUE, TION_CHANGE_STATUS_FALSE, TION_CHANGE_STATUS_NOT_SET),
			.state = get_boolean_from_json(cJSON_GetObjectItem(root, "state"), TION_CHANGE_STATUS_TRUE, TION_CHANGE_STATUS_FALSE, TION_CHANGE_STATUS_NOT_SET),
			.sound = get_boolean_from_json(cJSON_GetObjectItem(root, "sound"), TION_CHANGE_STATUS_TRUE, TION_CHANGE_STATUS_FALSE, TION_CHANGE_STATUS_NOT_SET),

			.check_sum = parse_number32_from_json_string(cJSON_GetObjectItem(root, "check_sum"), TION_CHANGE_STATUS_INVALID_CHECKSUM)
		};

		tion_bt_write_new_status(status);
	}

	cJSON_Delete(root);
}

void tion_timer_exec_function(void* arg) {
	tion_bt_request_status();
}

void tion_startup(const char * status_topic, const char * command_topic) {
	tion_status_topic = malloc(strlen(status_topic) + 1);
	if (tion_status_topic == NULL) {
		return;
	}

	INIT_DRIVER_AND_LOG_OR_RETURN(tion_bt_init(), "TION Driver initialized.", "Cant initialize TION driver: %d");

	memset(tion_status_topic, 0, strlen(status_topic) + 1);
	memcpy(tion_status_topic, status_topic, strlen(status_topic) + 1);

	mqtt_subscribe(command_topic, tion_commands);
	tion_bt_register_status_callback(tion_status_callback);

	esp_timer_create_args_t periodic_timer_args = {
			.callback = &tion_timer_exec_function,
			/* name is optional, but may help identify the timer when debugging */
			.name = "TION publish value"
	};

	esp_timer_handle_t periodic_timer;
	ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
	ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, TION_EXEC_PERIOD));
}
