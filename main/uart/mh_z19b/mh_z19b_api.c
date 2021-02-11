#include "mh_z19b_api.h"

#include "stdint.h"
#include "string.h"
#include "esp_err.h"

// https://github.com/strange-v/MHZ19/

#define MH_Z19B_BUF_SIZE 8

static uint8_t COMMAND_MHZ19_RANGE_1000[]  = { 0x99, 0x00, 0x00, 0x00, 0x03, 0xE8 };
static uint8_t COMMAND_MHZ19_RANGE_2000[]  = { 0x99, 0x00, 0x00, 0x00, 0x07, 0xD0 };
static uint8_t COMMAND_MHZ19_RANGE_3000[]  = { 0x99, 0x00, 0x00, 0x00, 0x0B, 0xB8 };
static uint8_t COMMAND_MHZ19_RANGE_5000[]  = { 0x99, 0x00, 0x00, 0x00, 0x13, 0x88 };
static uint8_t COMMAND_MHZ19_RANGE_10000[] = { 0x99, 0x00, 0x00, 0x00, 0x27, 0x10 };
static uint8_t COMMAND_MHZ19_CALIBRATE_ENABLE[]  = { 0x79, 0xA0, 0x00, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_CALIBRATE_DISABLE[] = { 0x79, 0x00, 0x00, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_READ_VALUE[]  = { 0x86, 0x00, 0x00, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_CALIBRATE_ZERO[] = { 0x87, 0x00, 0x00, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_CALIBRATE_SPAN[] = { 0x88, 0x00, 0x00, 0x00, 0x00, 0x00 };

static uart_port_t mh_z19b_uart_port;

uint8_t mh_z19b_crc(const uint8_t * buffer);
esp_err_t mh_z19b_send_buffer(const uint8_t * buffer, uint8_t * reply);

esp_err_t mh_z19b_init_driver(const uart_config_def_t * config, mh_z19b_range range) {
    uart_config_t uart_config = {
        .baud_rate = config->baud_rate,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_APB,
    };

    mh_z19b_uart_port = config->port;

    int intr_alloc_flags = 0;

#if CONFIG_UART_ISR_IN_IRAM
    intr_alloc_flags = ESP_INTR_FLAG_IRAM;
#endif

    esp_err_t res = uart_driver_install(mh_z19b_uart_port, MH_Z19B_BUF_SIZE * 2, 0, 0, NULL, intr_alloc_flags);
    if (res) {
    	return res;
    }

    res = uart_param_config(mh_z19b_uart_port, &uart_config);
    if (res) {
    	return res;
    }

    res = uart_set_pin(mh_z19b_uart_port, config->pin_txd, config->pin_rxd, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
    if (res) {
    	return res;
    }

    switch (range) {
		case MHZ19B_RANGE_1000:
			res = mh_z19b_send_buffer(COMMAND_MHZ19_RANGE_1000, NULL);
			break;
		case MHZ19B_RANGE_2000:
			res = mh_z19b_send_buffer(COMMAND_MHZ19_RANGE_2000, NULL);
			break;
		case MHZ19B_RANGE_3000:
			res = mh_z19b_send_buffer(COMMAND_MHZ19_RANGE_3000, NULL);
			break;
		case MHZ19B_RANGE_5000:
			res = mh_z19b_send_buffer(COMMAND_MHZ19_RANGE_5000, NULL);
			break;
		case MHZ19B_RANGE_10000:
			res = mh_z19b_send_buffer(COMMAND_MHZ19_RANGE_10000, NULL);
			break;
		default:
			res = ESP_FAIL;
			break;
	}

    return res;
}

esp_err_t mh_z19b_calibrate(uint16_t co2) {
	if (co2 == 0) {
		return mh_z19b_send_buffer(COMMAND_MHZ19_CALIBRATE_ZERO, NULL);
	} else {
		uint8_t buffer[6] = { 0 };
		memcpy(buffer, COMMAND_MHZ19_CALIBRATE_SPAN, 6);
		buffer[1] = co2 / 256;
		buffer[2] = co2 % 256;
		return mh_z19b_send_buffer(buffer, NULL);
	}
}

esp_err_t mh_z19b_autocalibrate(bool value) {
	return mh_z19b_send_buffer(value ? COMMAND_MHZ19_CALIBRATE_ENABLE : COMMAND_MHZ19_CALIBRATE_DISABLE, NULL);
}

esp_err_t mh_z19b_read(mh_z19b_data_t * data) {
	uint8_t buffer[9] = { 0 };

	esp_err_t res = mh_z19b_send_buffer(COMMAND_MHZ19_READ_VALUE, buffer);
	if (res) {
		return res;
	}

	data->co2 = buffer[2] * 256 + buffer[3];
	data->min_co2 = buffer[6] * 256 + buffer[7];
	data->temperature = buffer[4] - 40;
	data->accuracy = buffer[5];

	return ESP_OK;
}

esp_err_t mh_z19b_send_buffer(const uint8_t * buffer, uint8_t * reply) {
	uint8_t command[] = { 0xFF, 0x01, buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5], 0x00 };
	command[8] = mh_z19b_crc(buffer);

	while (true) {
		uint8_t buf;

		// cleanup buffer
		if (uart_read_bytes(mh_z19b_uart_port, &buf, 1, 10 / portTICK_RATE_MS)) {
			break;
		}
	}

	esp_err_t res = uart_write_bytes(mh_z19b_uart_port, command, 9);
	if (res) {
		return res;
	}

	if (reply == NULL) {
		return ESP_OK;
	}

	for (uint8_t i = 0; i<=5; i++) {
		if (i == 5) {
			return ESP_ERR_TIMEOUT;
		}

		if (!uart_read_bytes(mh_z19b_uart_port, reply, 9, 20 / portTICK_RATE_MS)) {
			break;
		}
	}

	uint8_t crc = mh_z19b_crc(reply);

	if (reply[0] != 0xFF) {
		return ESP_ERR_INVALID_RESPONSE;
	}
	if (reply[1] != buffer[1]) {
		return ESP_ERR_INVALID_RESPONSE;
	}
	if (reply[8] != crc) {
		return ESP_ERR_INVALID_CRC;
	}

	return ESP_OK;
}

uint8_t mh_z19b_crc(const uint8_t * buffer) {
	uint8_t crc = 0;
	for (uint8_t i = 1; i < 8; i++)
	{
		crc += buffer[i];
	}
	crc = 255 - crc;
	crc++;

	return crc;
}
