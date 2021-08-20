#include "bme280.h"

#include "string.h"

#include "bme280_api.h"
#include "../../cjson/cJSON.h"
#include "../../init/mqtt.h"
#include "../../init/init_logger.h"

#define BME280_EXEC_PERIOD 30000000

static i2c_handler_t * bme280_i2c = NULL;
static char* g_bme280_status_topic = NULL;

void bme280_timer_exec_function(void* arg) {
	bme280_data_t data = { 0 };
	if (bme280_read(bme280_i2c, &data)) {
		return;
	}

	cJSON *root = cJSON_CreateObject();
	cJSON_AddNumberToObject(root, "temperature", data.temperature);
	cJSON_AddNumberToObject(root, "humidity", data.humidity);
	cJSON_AddNumberToObject(root, "pressure", data.pressure);
	cJSON_AddNumberToObject(root, "heatindex", data.heatindex);
	cJSON_AddNumberToObject(root, "absolute_humidity", data.absolute_humidity);

	char * json = cJSON_Print(root);
	mqtt_publish(g_bme280_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);
}

esp_err_t bme280_read_absolute_humidity(double * absolute_humidity) {
	if (!bme280_i2c) {
		return ESP_FAIL;
	}

	bme280_data_t data = { 0 };
	esp_err_t res = bme280_read(bme280_i2c, &data);
	if (res) {
		return res;
	}

	*absolute_humidity = data.absolute_humidity;

	return ESP_OK;
}

void bme280_init(i2c_port_t port, const char* mqtt_topic) {
	bme280_i2c = i2c_get_handlers(port);
	if (bme280_i2c != NULL) {
		INIT_DRIVER_AND_LOG_OR_RETURN(bme280_init_driver(bme280_i2c), "BME280 driver initialized", "Cant initialize BME280 : 0x%04X");

		g_bme280_status_topic = malloc(strlen(mqtt_topic) + 1);
		memcpy(g_bme280_status_topic, mqtt_topic, strlen(mqtt_topic) + 1);

		esp_timer_create_args_t periodic_timer_args = {
				.callback = &bme280_timer_exec_function,
				/* name is optional, but may help identify the timer when debugging */
				.name = "bme280 publish value"
		};

		esp_timer_handle_t periodic_timer;
		ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
		ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, BME280_EXEC_PERIOD));
	}
}
