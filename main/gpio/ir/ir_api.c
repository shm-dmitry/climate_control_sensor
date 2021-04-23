#include "ir_api.h"

#include "../../log.h"

#include "driver/rmt.h"
#include "ir_tools/ir_tools.h"
#include "ir_def.h"
#include "string.h"

static ir_builder_t * nec_builder;
static ir_builder_t * rc5_builder;

#define IR_BUILD_BUFFER(builder, address, command, items, items_length) \
		builder->build_frame(builder, address, command); \
		builder->get_result(builder, &items, &items_length);

#define IR_BUILD_BUFFER_REPEAT(builder, items, items_length) \
		builder->build_repeat_frame(builder); \
		builder->get_result(builder, &items, &items_length);

// based on https://github.com/espressif/esp-idf/tree/master/examples/peripherals/rmt/ir_protocols

esp_err_t ir_transmit(uint8_t protocol, uint32_t address, uint32_t command) {
    rmt_item32_t *items = NULL;
    size_t length = 0;

    ESP_LOGI(IR_LOG, "Send command %02x to address %02x via protocol %d", command, address, protocol);

	switch(protocol) {
	case IR_PROTOCOL_NEC:
		IR_BUILD_BUFFER(nec_builder, address, command, items, length);
		rmt_write_items(RMT_CHANNEL_0, items, length, false);
		IR_BUILD_BUFFER_REPEAT(nec_builder, items, length);
		rmt_write_items(RMT_CHANNEL_0, items, length, false);
		break;
	case IR_PROTOCOL_RC5:
		IR_BUILD_BUFFER(rc5_builder, address, command, items, length);
		rmt_write_items(RMT_CHANNEL_0, items, length, false);
		IR_BUILD_BUFFER_REPEAT(rc5_builder, items, length);
		rmt_write_items(RMT_CHANNEL_0, items, length, false);
		break;
	default:
		return ESP_ERR_INVALID_ARG;
	}

	return ESP_OK;
}

esp_err_t ir_init(int gpio) {
	rmt_config_t rmt_tx_config = RMT_DEFAULT_CONFIG_TX(gpio, RMT_CHANNEL_0);
	rmt_tx_config.tx_config.carrier_en = true;

	esp_err_t res = rmt_config(&rmt_tx_config);
	if (res) {
		ESP_LOGE(IR_LOG, "rmt_config error %d", res);
		return res;
	}

	res = rmt_driver_install(RMT_CHANNEL_0, 0, 0);
	if (res) {
		ESP_LOGE(IR_LOG, "rmt_driver_install error %d", res);
		return res;
	}

	ir_builder_config_t ir_builder_config = IR_BUILDER_DEFAULT_CONFIG((ir_dev_t)RMT_CHANNEL_0);
	ir_builder_config.flags |= IR_TOOLS_FLAGS_PROTO_EXT;

	nec_builder = ir_builder_rmt_new_nec(&ir_builder_config);
	if (nec_builder == NULL) {
		ESP_LOGE(IR_LOG, "ir_builder_rmt_new_nec returned NULL");
		return ESP_FAIL;
	}

	rc5_builder = ir_builder_rmt_new_rc5(&ir_builder_config);
	if (rc5_builder == NULL) {
		ESP_LOGE(IR_LOG, "ir_builder_rmt_new_rc5 returned NULL");
		return ESP_FAIL;
	}

	ESP_LOGI(IR_LOG, "Driver initialized");

	return ESP_OK;
}
