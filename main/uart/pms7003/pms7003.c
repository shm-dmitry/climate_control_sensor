#include "pms7003.h"

#include "string.h"

#include "pms7003_api.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"

static char* pms7003_status_topic = NULL;

#define PMS7003_EXEC_PERIOD 60000000

void pms7003_timer_exec_function(void* arg) {
	pms7003_data_t data = { 0 };
	if (pms7003_read(&data)) {
		return;
	}

	cJSON *root = cJSON_CreateObject();
	cJSON_AddNumberToObject(root, "factory_pm_1_0",  data.factory_pm_1_0);
	cJSON_AddNumberToObject(root, "factory_pm_2_5",  data.factory_pm_2_5);
	cJSON_AddNumberToObject(root, "factory_pm_10_0", data.factory_pm_10_0);

	cJSON_AddNumberToObject(root, "atmospheric_pm_1_0",  data.atmospheric_pm_1_0);
	cJSON_AddNumberToObject(root, "atmospheric_pm_2_5",  data.atmospheric_pm_2_5);
	cJSON_AddNumberToObject(root, "atmospheric_pm_10_0", data.atmospheric_pm_10_0);

	cJSON_AddNumberToObject(root, "raw_0_3_um",  data.raw_0_3_um);
	cJSON_AddNumberToObject(root, "raw_0_5_um",  data.raw_0_5_um);
	cJSON_AddNumberToObject(root, "raw_1_0_um",  data.raw_1_0_um);
	cJSON_AddNumberToObject(root, "raw_2_5_um",  data.raw_2_5_um);
	cJSON_AddNumberToObject(root, "raw_5_0_um",  data.raw_5_0_um);
	cJSON_AddNumberToObject(root, "raw_10_0_um", data.raw_10_0_um);

	cJSON_AddNumberToObject(root, "version_number", data.version_number);
	cJSON_AddNumberToObject(root, "error_code",     data.error_code);

	char * json = cJSON_Print(root);
	mqtt_publish(pms7003_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);

}

void pms7003_init(const uart_config_def_t * config, const char * status_topic) {
	if (pms7003_init_driver(config)) {
		return;
	}

	if (pms7003_wakeup()) {
		return;
	}
	if (pms7003_set_active(true)) {
		return;
	}


	pms7003_status_topic = malloc(strlen(status_topic) + 1);
	memset(pms7003_status_topic, 0, strlen(status_topic) + 1);
	memcpy(pms7003_status_topic, status_topic, strlen(status_topic) + 1);

	esp_timer_create_args_t periodic_timer_args = {
			.callback = &pms7003_timer_exec_function,
			/* name is optional, but may help identify the timer when debugging */
			.name = "periodic"
	};

	esp_timer_handle_t periodic_timer;
	ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
	ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, PMS7003_EXEC_PERIOD));
}
