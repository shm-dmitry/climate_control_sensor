#include "mqtt.h"

#include "mqtt_client.h"
#include "nvs_rw.h"

#include "../log.h"

#define MAX_MQTT_URI_LEN 100
#define MAX_MQTT_USER_PASS 20

typedef struct mqtt_callback_mapping_t {
	char * topic;
	mqtt_topic_callback_t function;
} mqtt_callback_mapping_t;

mqtt_callback_mapping_t* callbacks = NULL;
uint8_t callbacks_count = 0;
esp_mqtt_client_handle_t client;

static void mqtt_event_handler_cb(esp_mqtt_event_handle_t event) {
	if (callbacks_count == 0) {
		return;
	}

	switch (event->event_id) {
	case MQTT_EVENT_CONNECTED:
		for (int i = 0; i<callbacks_count; i++) {
			esp_mqtt_client_subscribe(event->client, callbacks[i].topic, 0);
		}
		break;
	case MQTT_EVENT_DATA:
		if (event->data) {
			for (int i = 0; i<callbacks_count; i++) {
				if (strcmp(event->topic, callbacks[i].topic)) {
					callbacks[i].function(event->topic, event->data);
				}
			}
		}
		break;
	default:
		break;
	}
}

static void mqtt_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data) {
	mqtt_event_handler_cb(event_data);
}

void mqtt_publish_sync(const char * topic, const char * message) {
	if (client) {
		if (esp_mqtt_client_publish(client, topic, message, 0, 0, 1) >= 0) {
	    	ESP_LOGI(MQTT_LOG, "MQTT publish OK topic = %s, message = %s", topic, message);
		} else {
			mqtt_publish(topic, message);
		}
	}
}

void mqtt_publish(const char * topic, const char * message) {
	if (client) {
		if (esp_mqtt_client_enqueue(client, topic, message, 0, 0, 1, 1) >= 0) {
	    	ESP_LOGI(MQTT_LOG, "MQTT enqueue OK topic = %s, message = %s", topic, message);
		} else {
	    	ESP_LOGE(MQTT_LOG, "MQTT enqueue error: topic = %s, message = %s", topic, message);
		}
	}
}

void mqtt_subscribe(const char * topic, mqtt_topic_callback_t callback) {
	mqtt_callback_mapping_t* newtable = (mqtt_callback_mapping_t*) malloc(sizeof(mqtt_topic_callback_t) * (callbacks_count + 1));
	memset(newtable, 0, sizeof(mqtt_topic_callback_t) * (callbacks_count + 1));

	if (callbacks_count > 0) {
		memcpy(newtable, callbacks, sizeof(mqtt_topic_callback_t) * callbacks_count);
		free(callbacks);
		callbacks = NULL;
	}

	callbacks = newtable;

	callbacks[callbacks_count].topic = (char *) malloc(strlen(topic) + 1);
	memset(callbacks[callbacks_count].topic, 0, strlen(topic) + 1);
	strcpy(callbacks[callbacks_count].topic, topic);

	callbacks[callbacks_count].function = callback;

	callbacks_count++;

	ESP_LOGI(MQTT_LOG, "Client subscribed on topic %s", topic);
}

void mqtt_start() {
	esp_mqtt_client_config_t mqtt_cfg = {
		.uri = CONFIG_MQTT_BROKER_URI,
		.username = CONFIG_MQTT_BROKER_USERNAME,
		.password = CONFIG_MQTT_BROKER_PASSWORD,
	};

	client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_register_event(client, ESP_EVENT_ANY_ID, mqtt_event_handler, client);
    if (esp_mqtt_client_start(client)) {
    	client = NULL;
    	ESP_LOGE(MQTT_LOG, "Cant start MQTT client!");
    } else {
    	ESP_LOGI(MQTT_LOG, "MQTT started");
    }
}
