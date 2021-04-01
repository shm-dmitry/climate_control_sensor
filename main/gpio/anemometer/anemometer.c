#include "anemometer.h"

#include "anemometer_api.h"

#include "string.h"
#include "../../init/mqtt.h"
#include "../../cjson/cjson_helper.h"

static char* anemometer_status_topic = NULL;

void anemometer_callback(anemometer_data_t* data) {
	cJSON *root = cJSON_CreateObject();
	cJSON_AddNumberToObject(root, "direction", data->direction);

	if (data->raw_rps > 0) {
		cJSON_AddNumberToObject(root, "raw_rps", data->raw_rps);
	}

	if (data->speed > 0) {
		cJSON_AddNumberToObject(root, "speed", data->speed);
	}
	if (data->consumption > 0) {
		cJSON_AddNumberToObject(root, "consumption", data->consumption);
	}

	char date[25] = { 0 };
	struct tm * timeinfo = localtime(&data->updated);
	strftime(date, 25, "%Y-%m-%d %H:%M:%S", timeinfo);

	cJSON_AddStringToObject(root, "updated", date);

	char * json = cJSON_Print(root);
	mqtt_publish(anemometer_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);
}

void anemometer_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	char * type = cJSON_GetStringValue(cJSON_GetObjectItem(root, "type"));
	if (strcmp(type, "calibrate") == 0) {
		cJSON* data = cJSON_GetObjectItem(root, "data");
		cJSON* rows = cJSON_GetObjectItem(data, "rows");

		if (data != NULL &&
			!cJSON_IsNull(data) &&

			rows != NULL &&
			!cJSON_IsNull(rows) &&
			cJSON_IsArray(rows)
			) {
			anemometer_calibration_table_t table = {
				.rows_count = cJSON_GetArraySize(rows),
				.cross_sectional_area = get_float_from_json(cJSON_GetObjectItem(data, "cross_sectional_area"), ANEMOMETER_UNKNOWN_VALUE),
				.rows = NULL
			};

			if (table.rows_count > 0 && table.rows_count < ANEMOMETER_CALIBRATION_MAXROWS) {
				table.rows = (anemometer_calibration_table_row_t *) malloc(sizeof(anemometer_calibration_table_row_t) * table.rows_count);
				for (int i = 0; i<table.rows_count; i++) {
					cJSON* item = cJSON_GetArrayItem(rows, i);

					table.rows[i].rps   = get_float_from_json(cJSON_GetObjectItem(item, "rps"),   ANEMOMETER_UNKNOWN_VALUE);
					table.rows[i].speed = get_float_from_json(cJSON_GetObjectItem(item, "speed"), ANEMOMETER_UNKNOWN_VALUE);

					if (table.rows[i].rps < 0 || table.rows[i].speed < 0) {
						free(table.rows);
						table.rows = NULL;
						break;
					}
				}

				if (table.rows != NULL) {
					anemometer_calibrate(&table);
					free(table.rows);
				}
			}
		}
	} else if (strcmp(type, "calibrate_reset") == 0) {
		anemometer_calibrate(NULL);
	}

	cJSON_Delete(root);
}

void anemometer_startup(int gpio_A, int gpio_B, const char * status_topic, const char * command_topic) {
	anemometer_status_topic = malloc(strlen(status_topic) + 1);
	if (anemometer_status_topic == NULL) {
		return;
	}

	memcpy(anemometer_status_topic, status_topic, strlen(status_topic) + 1);

	if (anemometer_init(gpio_A, gpio_B, anemometer_callback)) {
		free(anemometer_status_topic);
		return;
	}

	mqtt_subscribe(command_topic, anemometer_commands);
}
