#include "pms7003_api.h"

#include "string.h"

#include "../../log.h"
#include "../../init/mqtt_logger.h"

#define PMS7003_BUF_SIZE 32
#define PMS7003_DRIVER_BUF_SIZE 1024
#define PMS7003_AWAIT_RESPONSE 1000
#define PMS7003_QUEUE_SIZE 10

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

    esp_err_t res = uart_driver_install(pms7003_uart_port, PMS7003_DRIVER_BUF_SIZE, PMS7003_DRIVER_BUF_SIZE, PMS7003_QUEUE_SIZE, NULL, intr_alloc_flags);
    if (res) {
    	ESP_LOGE(PMS7003_LOG, "uart_driver_install error: %d", res);
    	return res;
    }

	ESP_LOGI(PMS7003_LOG, "uart_set_pin OK");

    res = uart_param_config(pms7003_uart_port, &uart_config);
    if (res) {
    	ESP_LOGE(PMS7003_LOG, "uart_param_config error: %d", res);
    	return res;
    }

	ESP_LOGI(PMS7003_LOG, "uart_param_config OK");

    res = uart_set_pin(pms7003_uart_port, config->pin_txd, config->pin_rxd, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
    if (res) {
    	ESP_LOGE(PMS7003_LOG, "uart_set_pin error: %d", res);
    	return res;
    }

	ESP_LOGI(PMS7003_LOG, "uart_set_pin OK");

	res = pms7003_wakeup();
    if (res) {
    	ESP_LOGE(PMS7003_LOG, "Cant wakeup sensor: %d", res);
    	return res;
    }

	vTaskDelay(100 / portTICK_PERIOD_MS);

	res = pms7003_set_active(true);
	if (res) {
    	ESP_LOGE(PMS7003_LOG, "Cant set sensor state == active: %d", res);
		return res;
	}

	for (int i = 0; i<5; i++) {
		vTaskDelay(1000 / portTICK_PERIOD_MS);

		pms7003_data_t data = { 0 };
		res = pms7003_read(&data);
		if (res) {
			ESP_LOGE(PMS7003_LOG, "Cant read data from sensor: %d", res);
		} else {
			return ESP_OK;
		}
	}

    return res;
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

	data->factory_pm_1_0 =  (reply[4] << 8) + reply[5];
	data->factory_pm_2_5 =  (reply[6] << 8) + reply[7];
	data->factory_pm_10_0 = (reply[8] << 8) + reply[9];

	data->atmospheric_pm_1_0 =  (reply[10] << 8) + reply[11];
	data->atmospheric_pm_2_5 =  (reply[12] << 8) + reply[13];
	data->atmospheric_pm_10_0 = (reply[14] << 8) + reply[15];

	data->raw_0_3_um =  (reply[16] << 8) + reply[17];
	data->raw_0_5_um =  (reply[18] << 8) + reply[29];
	data->raw_1_0_um =  (reply[20] << 8) + reply[21];
	data->raw_2_5_um =  (reply[22] << 8) + reply[23];
	data->raw_5_0_um =  (reply[24] << 8) + reply[25];
	data->raw_10_0_um = (reply[26] << 8) + reply[27];

	data->version_number = reply[28];
	data->error_code = reply[29];

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
	MQTT_LOG_INIT(PMS7003_LOG);

	while (true) {
		uint8_t buf;

		// cleanup buffer
		if (uart_read_bytes(pms7003_uart_port, &buf, 1, 10 / portTICK_RATE_MS) <= 0) {
			break;
		}
	}

	MQTT_LOGI(PMS7003_LOG, "pms7003_send_buffer  ready-to-send: input queue empty");
	MQTT_LOG_BUFFER_HEXDUMP(PMS7003_LOG, command, PMS7003_COMMAND_SIZE, ESP_LOG_INFO);

	esp_err_t res = uart_write_bytes(pms7003_uart_port, command, PMS7003_COMMAND_SIZE);
	if (res <= 0) {
		MQTT_LOGE(PMS7003_LOG, "pms7003_send_buffer  Cant send data to device");
		MQTT_LOG_DONE;
		return ESP_FAIL;
	}

	if (reply == NULL) {
		MQTT_LOG_DONE;
		return ESP_OK;
	}

	memset(reply, 0xbb, PMS7003_BUF_SIZE);

	uint8_t await = PMS7003_AWAIT_RESPONSE / 20;
	uint8_t reply_index = 0;
	for (uint8_t i = 0; i<=await; i++) {
		if (i == await) {
			MQTT_LOGE(PMS7003_LOG, "pms7003_send_buffer  Timeout awaiting for a data from device.");
			MQTT_LOG_DONE;
			return ESP_ERR_TIMEOUT;
		}

		int readed = uart_read_bytes(pms7003_uart_port, reply + reply_index, PMS7003_BUF_SIZE - reply_index, 20 / portTICK_RATE_MS);
		if (readed > 0) {
			reply_index += readed;
			if (reply_index >= PMS7003_BUF_SIZE) {
				break;
			}
		}
	}

	MQTT_LOGI(PMS7003_LOG, "Received reply from device");
	MQTT_LOG_BUFFER_HEXDUMP(PMS7003_LOG, reply, PMS7003_BUF_SIZE, ESP_LOG_INFO);

	uint16_t crc = pms7003_crc(reply);

	if (reply[0] != 0x42) {
		MQTT_LOGE(PMS7003_LOG, "pms7003_send_buffer  Invalid response: bad byte#0");
		MQTT_LOG_DONE;
		return ESP_ERR_INVALID_RESPONSE;
	}
	if (reply[1] != 0x4d) {
		MQTT_LOGE(PMS7003_LOG, "pms7003_send_buffer  Invalid response: bad byte#1");
		MQTT_LOG_DONE;
		return ESP_ERR_INVALID_RESPONSE;
	}
	if ((reply[PMS7003_BUF_SIZE - 2] << 8 | reply[PMS7003_BUF_SIZE - 1]) != crc) {
		MQTT_LOGE(PMS7003_LOG, "pms7003_send_buffer  Invalid response: bad CRC");
		MQTT_LOG_DONE;
		return ESP_ERR_INVALID_CRC;
	}

	MQTT_LOG_DONE;

	return ESP_OK;
}

