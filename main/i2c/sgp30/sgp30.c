#include "sgp30.h"

#include "string.h"

#include "sgp30_api.h"
#include "../bme280/bme280.h"
#include "../../cjson/cJSON.h"
#include "../../init/mqtt.h"
#include "../../init/init_logger.h"

#define SGP30_EXEC_PERIOD 30000000
#define SGP30_APPLY_COMPENSATION_PERIOD 60000000

static i2c_handler_t * sgp30_i2c = NULL;
static char* g_sgp30_status_topic = NULL;

void sgp30_timer_exec_function(void* arg) {
	sgp30_data_t data = { 0 };
	if (sgp30_read(sgp30_i2c, &data)) {
		return;
	}

	cJSON *root = cJSON_CreateObject();
	if (data.tvoc != SGP30_VALUE_NODATA) {
		cJSON_AddNumberToObject(root, "tvoc", data.tvoc);
	}
	if (data.eco2 != SGP30_VALUE_NODATA) {
		cJSON_AddNumberToObject(root, "eco2", data.eco2);
	}
	if (data.h2 != SGP30_VALUE_NODATA) {
		cJSON_AddNumberToObject(root, "h2", data.h2);
	}
	if (data.ethanol != SGP30_VALUE_NODATA) {
		cJSON_AddNumberToObject(root, "ethanol", data.ethanol);
	}

	char * json = cJSON_Print(root);
	mqtt_publish(g_sgp30_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);
}

void sgp30_timer_apply_correction_function(void* arg) {
	double value = 0;
	if (bme280_read_absolute_humidity(&value)) {
		return;
	}

	if (value > 0) {
		sgp30_set_humidity(sgp30_i2c, value);
	}
}

void sgp30_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	char * type = cJSON_GetStringValue(cJSON_GetObjectItem(root, "type"));
	if (strcmp(type, "calibrate") == 0) {
		sgp30_recalibrate(sgp30_i2c);
	}
}


void sgp30_init(i2c_port_t port, const char* mqtt_topic, const char * command_topic) {
	sgp30_i2c = i2c_get_handlers(port);
	if (sgp30_i2c != NULL) {
		INIT_DRIVER_AND_LOG_OR_RETURN(sgp30_write_init(sgp30_i2c), "SGP30 Driver initialized.", "Cant initialize SGP30 driver: 0x%04X");

		g_sgp30_status_topic = malloc(strlen(mqtt_topic) + 1);
		memcpy(g_sgp30_status_topic, mqtt_topic, strlen(mqtt_topic) + 1);

		mqtt_subscribe(command_topic, sgp30_commands);

		esp_timer_create_args_t periodic_timer_args = {
				.callback = &sgp30_timer_exec_function,
				/* name is optional, but may help identify the timer when debugging */
				.name = "sgp30 publish value"
		};

		esp_timer_handle_t periodic_timer;
		ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
		ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, SGP30_EXEC_PERIOD));
	}
}

void sgp30_init_auto_compensation() {
	if (sgp30_i2c != NULL) {
		esp_timer_create_args_t periodic_timer_args = {
				.callback = &sgp30_timer_apply_correction_function,
				/* name is optional, but may help identify the timer when debugging */
				.name = "bh1750 auto compensation from BME280"
		};

		esp_timer_handle_t periodic_timer;
		ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
		ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, SGP30_APPLY_COMPENSATION_PERIOD));
	}
}

