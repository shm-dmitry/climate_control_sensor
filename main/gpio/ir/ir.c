#include "ir.h"

#include "ir_api.h"
#include "ir_def.h"
#include "../../cjson/cjson_helper.h"
#include "../../init/mqtt.h"
#include "string.h"
#include "../../log.h"


#define IR_UNKNOWN 0x00

void ir_commands(const char * topic, const char * data) {
	cJSON *root = cJSON_Parse(data);
	if (root == NULL) {
		return;
	}

	uint32_t address = get_number32_from_json(cJSON_GetObjectItem(root, "address"), IR_UNKNOWN);
	uint32_t command = get_number32_from_json(cJSON_GetObjectItem(root, "command"), IR_UNKNOWN);
	uint8_t protocol = strcmp(cJSON_GetStringValue(cJSON_GetObjectItem(root, "protocol")), "nec") == 0 ? IR_PROTOCOL_NEC : IR_PROTOCOL_RC5;

	if (command != IR_UNKNOWN && address != IR_UNKNOWN) {
		ir_transmit(protocol, address, command);
	} else {
		ESP_LOGE(IR_LOG, "Invalid request. address = %d, command = %d, protocol = %d", address, command, protocol);
	}

	cJSON_Delete(root);
}

void ir_startup(int gpio, const char * command_topic) {
	if (ir_init(gpio)) {
		return;
	}

	mqtt_subscribe(command_topic, ir_commands);
}
