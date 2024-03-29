#include "mh_z19b_api.h"

#include "stdint.h"
#include "string.h"
#include "esp_err.h"
#include "../../log.h"
#include "../../init/mqtt_logger.h"

// https://github.com/strange-v/MHZ19/

#define MH_Z19B_BUF_SIZE 9
#define MH_Z19B_DRIVER_BUF_SIZE 1024
#define MH_Z19B_QUEUE_SIZE 10
#define MH_Z19B_AWAIT_RESPONSE 1000

static uint8_t COMMAND_MHZ19_RANGE_1000[]  = { 0x99, 0x03, 0xE8, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_RANGE_2000[]  = { 0x99, 0x07, 0xD0, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_RANGE_3000[]  = { 0x99, 0x0B, 0xB8, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_RANGE_5000[]  = { 0x99, 0x13, 0x88, 0x00, 0x00, 0x00 };
static uint8_t COMMAND_MHZ19_RANGE_10000[] = { 0x99, 0x27, 0x10, 0x00, 0x00, 0x00 };
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

    esp_err_t res = uart_driver_install(mh_z19b_uart_port, MH_Z19B_DRIVER_BUF_SIZE, MH_Z19B_DRIVER_BUF_SIZE, MH_Z19B_QUEUE_SIZE, NULL, intr_alloc_flags);
    if (res) {
    	ESP_LOGE(MH_Z19B_LOG, "uart_driver_install error: %d", res);
    	return res;
    }

    res = uart_param_config(mh_z19b_uart_port, &uart_config);
    if (res) {
    	ESP_LOGE(MH_Z19B_LOG, "uart_param_config error: %d", res);
    	return res;
    }

    res = uart_set_pin(mh_z19b_uart_port, config->pin_txd, config->pin_rxd, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
    if (res) {
    	ESP_LOGE(MH_Z19B_LOG, "uart_set_pin error: %d", res);
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

    if (res) {
    	ESP_LOGE(MH_Z19B_LOG, "mh_z19b_send_buffer(range) error: %d", res);
    	return res;
    } else {
    	ESP_LOGI(MH_Z19B_LOG, "mh_z19b_send_buffer(range) OK");
    }

	vTaskDelay(100 / portTICK_PERIOD_MS);

    res = mh_z19b_autocalibrate(false);
    if (res) {
    	ESP_LOGE(MH_Z19B_LOG, "mh_z19b_autocalibrate(false) error: %d", res);
    }

	for (int i = 0; i<5; i++) {
		vTaskDelay(1000 / portTICK_PERIOD_MS);

		mh_z19b_data_t data = {0};
		res = mh_z19b_read(&data);
		if (res) {
			ESP_LOGE(MH_Z19B_LOG, "Cant read data from sensor: %d", res);
		} else {
			return ESP_OK;
		}
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
		ESP_LOGE(MH_Z19B_LOG, "mh_z19b_read error: %d", res);
		return res;
	}

	data->co2 = buffer[2] * 256 + buffer[3];
	data->min_co2 = buffer[6] * 256 + buffer[7];
	data->temperature = buffer[4] - 40;
	data->accuracy = buffer[5];

	return ESP_OK;
}

esp_err_t mh_z19b_send_buffer(const uint8_t * buffer, uint8_t * reply) {
	MQTT_LOG_INIT(MH_Z19B_LOG);

	uint8_t command[] = { 0xFF, 0x01, buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5], 0x00 };
	command[8] = mh_z19b_crc(command);

	MQTT_LOGI(MH_Z19B_LOG, "mh_z19b_send_buffer  send buffer ready");

	while (true) {
		uint8_t buf;

		// cleanup buffer
		if (uart_read_bytes(mh_z19b_uart_port, &buf, 1, 10 / portTICK_RATE_MS) <= 0) {
			break;
		}

		MQTT_LOGI(MH_Z19B_LOG, "mh_z19b_send_buffer  skipped byte before exec command: %02x", buf);
	}

	MQTT_LOGI(MH_Z19B_LOG, "mh_z19b_send_buffer  ready-to-send: input queue empty");
	MQTT_LOG_BUFFER_HEXDUMP(MH_Z19B_LOG, command, 9, ESP_LOG_INFO);

	int res = uart_write_bytes(mh_z19b_uart_port, command, 9);
	if (res <= 0) {
		MQTT_LOGE(MH_Z19B_LOG, "mh_z19b_send_buffer  Cant send data to device");
		MQTT_LOG_DONE;
		return ESP_FAIL;
	}

	if (reply == NULL) {
		MQTT_LOG_DONE;
		return ESP_OK;
	}

	memset(reply, 0, 9);

	uint8_t await = MH_Z19B_AWAIT_RESPONSE / 20;
	uint8_t reply_index = 0;
	for (uint8_t i = 0; i<=await; i++) {
		if (i == await) {
			MQTT_LOGE(MH_Z19B_LOG, "mh_z19b_send_buffer  Timeout awaiting for a data from device. At this moment readed %d bytes", reply_index);
			MQTT_LOG_DONE;
			return ESP_ERR_TIMEOUT;
		}

		vTaskDelay(20 / portTICK_PERIOD_MS);

		int readed = uart_read_bytes(mh_z19b_uart_port, reply + reply_index, MH_Z19B_BUF_SIZE - reply_index, 1 / portTICK_RATE_MS);
		if (readed > 0) {
			reply_index += readed;
			if (reply_index >= MH_Z19B_BUF_SIZE) {
				break;
			}
		}
	}

	MQTT_LOGI(MH_Z19B_LOG, "Received reply from device");
	MQTT_LOG_BUFFER_HEXDUMP(MH_Z19B_LOG, reply, 9, ESP_LOG_INFO);

	uint8_t crc = mh_z19b_crc(reply);

	if (reply[0] != 0xFF) {
		MQTT_LOGE(MH_Z19B_LOG, "mh_z19b_send_buffer  Invalid response from device (bad magic byte)");
		MQTT_LOG_DONE;
		return ESP_ERR_INVALID_RESPONSE;
	}
	if (reply[1] != buffer[0]) {
		MQTT_LOGE(MH_Z19B_LOG, "mh_z19b_send_buffer  Invalid response from device (bad command)");
		MQTT_LOG_DONE;
		return ESP_ERR_INVALID_RESPONSE;
	}
	if (reply[8] != crc) {
		MQTT_LOGE(MH_Z19B_LOG, "mh_z19b_send_buffer  Invalid response from device (bad crc)");
		MQTT_LOG_DONE;
		return ESP_ERR_INVALID_CRC;
	}

	MQTT_LOGI(MH_Z19B_LOG, "mh_z19b_send_buffer  Readed response from device.");
	MQTT_LOG_DONE;

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
