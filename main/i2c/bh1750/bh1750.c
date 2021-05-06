#include "bh1750.h"

#include "string.h"

#include "bh1750_api.h"
#include "../../cjson/cJSON.h"
#include "../../init/mqtt.h"

#define BH1750_EXEC_PERIOD 30000000

static i2c_handler_t * bh1750_i2c = NULL;
static char* g_bh1750_status_topic = NULL;

void bh1750_timer_exec_function(void* arg) {
	uint16_t lux = 0;
	if (bh1750_read(bh1750_i2c, &lux)) {
		return;
	}

	cJSON *root = cJSON_CreateObject();
	cJSON_AddNumberToObject(root, "light_level", lux);

	char * json = cJSON_Print(root);
	mqtt_publish(g_bh1750_status_topic, json);
	cJSON_free(json);

	cJSON_Delete(root);
}

void bh1750_init(i2c_port_t port, const char* mqtt_topic) {
	bh1750_i2c = i2c_get_handlers(port);
	if (bh1750_i2c != NULL) {
		if (bh1750_configure(bh1750_i2c)) {
			return;
		}

		g_bh1750_status_topic = malloc(strlen(mqtt_topic) + 1);
		memcpy(g_bh1750_status_topic, mqtt_topic, strlen(mqtt_topic) + 1);

		esp_timer_create_args_t periodic_timer_args = {
				.callback = &bh1750_timer_exec_function,
				/* name is optional, but may help identify the timer when debugging */
				.name = "bh1750 publish value"
		};

		esp_timer_handle_t periodic_timer;
		ESP_ERROR_CHECK(esp_timer_create(&periodic_timer_args, &periodic_timer));
		ESP_ERROR_CHECK(esp_timer_start_periodic(periodic_timer, BH1750_EXEC_PERIOD));
	}
}
