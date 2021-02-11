#include "pms7003_api.h"

#define PMS7003_BUF_SIZE 32

#define PMS7003_COMMAND_SIZE        7
#define PMS7003_COMMAND_WAKEUP      { 0x42, 0x4D, 0xE4, 0x00, 0x01, 0x01, 0x74 }
#define PMS7003_COMMAND_SLEEP       { 0x42, 0x4D, 0xE4, 0x00, 0x00, 0x01, 0x73 }
#define PMS7003_COMMAND_SET_PASSIVE { 0x42, 0x4D, 0xE1, 0x00, 0x00, 0x01, 0x70 }
#define PMS7003_COMMAND_SET_ACTIVE  { 0x42, 0x4D, 0xE1, 0x00, 0x01, 0x01, 0x71 }
#define PMS7003_COMMAND_READ_DATA   { 0x42, 0x4D, 0xE2, 0x00, 0x00, 0x01, 0x71 }

static uart_port_t pms7003_uart_port;

// https://github.com/Ptelka/PMS7003/blob/master/PMS7003.h
// https://www.espruino.com/datasheets/PMS7003.pdf
// https://github.com/jmstriegel/Plantower_PMS7003/blob/master/Plantower_PMS7003.h

esp_err_t pms7003_send_buffer(const uint8_t * command, uint8_t * reply);

esp_err_t pms7003_init_driver(const uart_config_def_t * config) {
    uart_config_t uart_config = {
        .baud_rate = config->baud_rate,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_APB,
    };

    pms7003_uart_port = config->port;

    int intr_alloc_flags = 0;

#if CONFIG_UART_ISR_IN_IRAM
    intr_alloc_flags = ESP_INTR_FLAG_IRAM;
#endif

    esp_err_t res = uart_driver_install(pms7003_uart_port, PMS7003_BUF_SIZE * 2, 0, 0, NULL, intr_alloc_flags);
    if (res) {
    	return res;
    }

    res = uart_param_config(pms7003_uart_port, &uart_config);
    if (res) {
    	return res;
    }

    res = uart_set_pin(pms7003_uart_port, config->pin_txd, config->pin_rxd, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
    if (res) {
    	return res;
    }

    return ESP_OK;
}

esp_err_t pms7003_sleep() {
	uint8_t command[] = PMS7003_COMMAND_SLEEP;
	return pms7003_send_buffer(command, NULL);
}

esp_err_t pms7003_wakeup() {
	uint8_t command[] = PMS7003_COMMAND_WAKEUP;
	return pms7003_send_buffer(command, NULL);
}

esp_err_t pms7003_set_active(bool is_active) {
	if (is_active) {
		uint8_t command[] = PMS7003_COMMAND_SET_ACTIVE;
		return pms7003_send_buffer(command, NULL);
	} else {
		uint8_t command[] = PMS7003_COMMAND_SET_PASSIVE;
		return pms7003_send_buffer(command, NULL);
	}
}

esp_err_t pms7003_read(pms7003_data_t * data) {
	uint8_t command[] = PMS7003_COMMAND_READ_DATA;
	uint8_t reply[PMS7003_BUF_SIZE] = { 0 };

	esp_err_t res = pms7003_send_buffer(command, reply);
	if (res) {
		return res;
	}

	data->factory_pm_1_0 =  (reply[5] << 8) + reply[6];
	data->factory_pm_2_5 =  (reply[7] << 8) + reply[8];
	data->factory_pm_10_0 = (reply[9] << 8) + reply[10];

	data->atmospheric_pm_1_0 =  (reply[11] << 8) + reply[12];
	data->atmospheric_pm_2_5 =  (reply[13] << 8) + reply[14];
	data->atmospheric_pm_10_0 = (reply[15] << 8) + reply[16];

	data->raw_0_3_um =  (reply[17] << 8) + reply[18];
	data->raw_0_5_um =  (reply[19] << 8) + reply[20];
	data->raw_1_0_um =  (reply[21] << 8) + reply[22];
	data->raw_2_5_um =  (reply[23] << 8) + reply[24];
	data->raw_5_0_um =  (reply[25] << 8) + reply[26];
	data->raw_10_0_um = (reply[27] << 8) + reply[28];

	data->version_number = reply[29];
	data->error_code = reply[30];

	return ESP_OK;
}

uint16_t pms7003_crc(uint8_t * reply) {
	uint16_t sum = 0;

	for(int i=0; i<PMS7003_BUF_SIZE - 2; i++){
		sum += reply[i];
	}

	return sum;
}

esp_err_t pms7003_send_buffer(const uint8_t * command, uint8_t * reply) {
	while (true) {
		uint8_t buf;

		// cleanup buffer
		if (uart_read_bytes(pms7003_uart_port, &buf, 1, 10 / portTICK_RATE_MS)) {
			break;
		}
	}

	esp_err_t res = uart_write_bytes(pms7003_uart_port, command, PMS7003_COMMAND_SIZE);
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

		if (!uart_read_bytes(pms7003_uart_port, reply, PMS7003_BUF_SIZE, 20 / portTICK_RATE_MS)) {
			break;
		}
	}

	uint16_t crc = pms7003_crc(reply);

	if (reply[0] != 0x42) {
		return ESP_ERR_INVALID_RESPONSE;
	}
	if (reply[1] != 0x4d) {
		return ESP_ERR_INVALID_RESPONSE;
	}
	if ((reply[PMS7003_BUF_SIZE - 2] << 8 | reply[PMS7003_BUF_SIZE - 1]) != crc) {
		return ESP_ERR_INVALID_CRC;
	}

	return ESP_OK;
}

