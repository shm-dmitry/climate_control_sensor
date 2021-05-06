#include "tion_api.h"
#include "stdlib.h"
#include "../log.h"
#include "esp_gattc_api.h"
#include "string.h"

#define COMMAND_PAIR 5
#define COMMAND_REQUEST_PARAMS 1
#define COMMAND_WRITE_PARAMS 2
#define BUFFER_SIZE 20

uint8_t tion_api_decode_mode(uint8_t mode);

uint8_t* tion_api_create_buffer(uint8_t command) {
	uint8_t* buffer = (uint8_t *)malloc(BUFFER_SIZE);
	if (!buffer) {
		ESP_LOGE(TION_LOG, "tion_api_create_buffer malloc error - no memory");
		return 0;
	}

	memset((void *)buffer, 0, BUFFER_SIZE);

	buffer[0] = 61;
	buffer[1] = command;
	if (command == COMMAND_PAIR) {
		buffer[2] = 1;
	}
	buffer[BUFFER_SIZE - 1] = 90;

	return buffer;
}

esp_err_t tion_api_send_pair_command(uint16_t gattc_if, uint16_t conn_id, uint16_t pair_handle) {
	uint8_t* buffer = tion_api_create_buffer(COMMAND_PAIR);
	if (!buffer) {
		ESP_LOGE(TION_LOG, "tion_api_send_pair_command malloc error - no memory");
		return ESP_FAIL;
	}

	// maybe write desc before??

	ESP_LOGI(TION_LOG, "Sending PAIR command to %02x", pair_handle);
	ESP_LOG_BUFFER_HEXDUMP(TION_LOG, buffer, BUFFER_SIZE, ESP_LOG_INFO);

	esp_err_t result = esp_ble_gattc_write_char(
							  gattc_if,
                              conn_id,
							  pair_handle,
							  BUFFER_SIZE,
							  buffer,
                              ESP_GATT_WRITE_TYPE_RSP,
                              ESP_GATT_AUTH_REQ_NONE);
	if (result) {
		ESP_LOGE(TION_LOG, "tion_api_send_pair_command error: %d", result);
	}

	free(buffer);

	return result;
}

esp_err_t tion_api_send_request_data_command(uint16_t gattc_if, uint16_t conn_id, uint16_t write_handle) {
	uint8_t* buffer = tion_api_create_buffer(COMMAND_REQUEST_PARAMS);
	if (!buffer) {
		ESP_LOGE(TION_LOG, "tion_api_send_request_data_command malloc error - no memory");
		return ESP_FAIL;
	}

	// maybe write desc before??

	esp_err_t result = esp_ble_gattc_write_char(
							  gattc_if,
                              conn_id,
							  write_handle,
							  BUFFER_SIZE,
							  buffer,
                              ESP_GATT_WRITE_TYPE_RSP,
                              ESP_GATT_AUTH_REQ_NONE);
	if (result) {
		ESP_LOGE(TION_LOG, "tion_api_send_request_data_command error: %d", result);
	}

	free(buffer);

	return result;
}

esp_err_t tion_api_send_write_data_command(uint16_t gattc_if, uint16_t conn_id, uint16_t write_handle, tion_change_status_t status) {
	uint8_t* buffer = tion_api_create_buffer(COMMAND_WRITE_PARAMS);
	if (!buffer) {
		ESP_LOGE(TION_LOG, "tion_api_send_write_data_command malloc error - no memory");
		return ESP_FAIL;
	}

	buffer[2] = status.fan_speed;
	buffer[3] = status.target_temperature;
	buffer[4] = tion_api_decode_mode(status.mode);
	buffer[5] = status.heater | (status.state << 1) | (status.sound << 3);

	// maybe write desc before??
	esp_err_t result = esp_ble_gattc_write_char(
							  gattc_if,
                              conn_id,
							  write_handle,
							  BUFFER_SIZE,
							  buffer,
                              ESP_GATT_WRITE_TYPE_RSP,
                              ESP_GATT_AUTH_REQ_NONE);
	if (result) {
		ESP_LOGE(TION_LOG, "tion_api_send_write_data_command error: %d", result);
	}

	free(buffer);

	return result;
}

uint8_t tion_api_decode_mode(uint8_t mode) {
	switch (mode) {
	case TION_MODE_RECIRCULATION:
		return TION_MODE_RECIRCULATION;
	case TION_MODE_MIXED:
		return TION_MODE_MIXED;
	case TION_MODE_OUTDOOR:
		return TION_MODE_OUTDOOR;
	default:
		return TION_MODE_OUTDOOR;
	}
}

uint32_t tion_api_calculate_check_sum(uint8_t fan_speed, uint8_t target_temperature, uint8_t mode, bool heater, bool state, bool sound) {
	return  fan_speed +
			target_temperature * 256 +
			mode * 256*256 +
			((heater ? 1 : 0) +
			 (state ? 2 : 0) +
			 (sound ? 4 : 0)) * 256*256*256;
}

int8_t tion_api_decode_temperature(uint8_t temp) {
	if (temp < 0b10000000) {
		return temp;
	} else {
		return -((int8_t) (temp - 0b10000000) + (int8_t) 0b10000000 + 1);
	}
}

tion_status_t * tion_api_decode_status(uint8_t* buffer, uint16_t buffer_size) {
	if (buffer_size < BUFFER_SIZE) {
		return NULL;
	}

	tion_status_t* value = malloc(sizeof(tion_status_t));
	if (value == NULL) {
		return NULL;
	}

	memset(value, 0, sizeof(tion_status_t));

	value->fan_spped = buffer[2] % 16;
	value->mode = tion_api_decode_mode(buffer[2] / 16);
	value->heater = buffer[4] & 1 ? true : false;
	value->state = (buffer[4] >> 1) & 1 ? true : false;
	value->timer = (buffer[4] >> 2) & 1 ? true : false;
	value->sound = (buffer[4] >> 3) & 1 ? true : false;
	value->target_temperature = buffer[3];
	value->outdoor_temperature = tion_api_decode_temperature(buffer[7]);
	value->indoor_temperature = tion_api_decode_temperature(buffer[8]);
	value->filter_remain = buffer[10] * 256 + buffer[9];
	value->error_code = buffer[13];
	value->time = buffer[11] * 256 + buffer[12];
	value->productivity = buffer[14];
	value->fw_version = buffer[18] * 256 + buffer[17];

	value->check_sum = tion_api_calculate_check_sum(value->fan_spped, value->target_temperature, value->mode, value->heater, value->state, value->sound);

	time(&value->updated);

	return value;
}
