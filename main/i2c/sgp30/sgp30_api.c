#include "sgp30_api.h"

#include "../../log.h"
#include "sgp30_nvs.h"

#define SGP30_CALIBRATION_TASK_STACK_SIZE 4096

#define SGP30_I2C_ADDRESS 0x58

#define SGP30_INIT_STATUS_NOT_INITIALIZED  0x00
#define SGP30_INIT_STATUS_INITIALIZING     0x01
#define SGP30_INIT_STATUS_INITIALIZED      0x02
#define SGP30_INIT_STATUS_ERROR            0x03

const uint8_t SGP30_COMMAND_INIT[] = { 0x20, 0x03 };
const uint8_t SGP30_COMMAND_READ[] = { 0x20, 0x08 };
const uint8_t SGP30_COMMAND_READ_RAW[] = { 0x20, 0x50 };
const uint8_t SGP30_COMMAND_READ_BASELINE[] = { 0x20, 0x15 };
const uint8_t SGP30_COMMAND_WRITE_BASELINE[] = { 0x20, 0x1E };
const uint8_t SGP30_COMMAND_SET_HUMIDITY[] = { 0x20, 0x61 };
const uint8_t SGP30_COMMAND_SOFT_RESET[] = { 0x00, 0x06 };
const uint8_t SGP30_COMMAND_GET_SERIAL_ID[] = { 0x36, 0x82 };
const uint8_t SGP30_COMMAND_GET_FEATURE_SET[] = { 0x20, 0x2F };

static uint8_t sgp30_init_status = SGP30_INIT_STATUS_NOT_INITIALIZED;

esp_err_t sgp30_read_internal(i2c_handler_t * i2c, sgp30_data_t * result, bool query_raw_signals);
esp_err_t sgp30_write_read_word(i2c_handler_t * i2c, const uint8_t * command, uint16_t * buffer, uint8_t buffer_size);
esp_err_t sgp30_get_feature_set(i2c_handler_t * i2c);
esp_err_t sgp30_get_serial_id(i2c_handler_t * i2c);

static uint8_t sgp30_crc(uint16_t data) {
	uint8_t crc = 0xFF;

	crc ^= (data >> 8);

	for (uint8_t i = 0; i < 8; i++) {
		if ((crc & 0x80) != 0)
			crc = (uint8_t) ((crc << 1) ^ 0x31);
		else
			crc <<= 1;
	}
	crc ^= (uint8_t) data;

	for (uint8_t i = 0; i < 8; i++) {
		if ((crc & 0x80) != 0)
			crc = (uint8_t) ((crc << 1) ^ 0x31);
		else
			crc <<= 1;
	}

	return crc;
}

static void sgp30_calibration_task(void* arg) {
	i2c_handler_t * i2c = (i2c_handler_t*) arg;

	esp_err_t res = ESP_OK;
	sgp30_data_t result = { 0 };
	for (int i = 0; i<20; i++) {
		vTaskDelay(1000 / portTICK_PERIOD_MS);

		res = sgp30_read_internal(i2c, &result, false);
		//if (res) {
		//	ESP_LOGE(SGP30_LOG, "Calibration failed: %d", res);
		//	sgp30_init_status = SGP30_INIT_STATUS_ERROR;
		//	vTaskDelete(NULL);
		//	return;
		//}
	}

	ESP_LOGI(SGP30_LOG, "Calibration done. Driver initialized.");
	sgp30_init_status = SGP30_INIT_STATUS_INITIALIZED;

	sgp30_baseline_t baseline = { 0 };
	res = sgp30_read_baseline(i2c, &baseline);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant read baseline after calibration: %d Information will not be stored in NVS.", res);
	} else {
		res = sgp30_nvs_save_baseline(&baseline);
		if (res) {
			ESP_LOGE(SGP30_LOG, "Baseline tvoc = %d, co2 = %d was not saved in NVS: result %d", baseline.tvoc, baseline.co2, res);
		} else {
			ESP_LOGI(SGP30_LOG, "Baseline tvoc = %d, co2 = %d saved in NVS: result %d", baseline.tvoc, baseline.co2, res);
		}
	}

	vTaskDelete(NULL);
}

esp_err_t sgp30_read_baseline(i2c_handler_t * i2c, sgp30_baseline_t * baseline) {
	uint16_t _baseline[2] = { 0x00 };
	esp_err_t res = sgp30_write_read_word(i2c, SGP30_COMMAND_READ_BASELINE, _baseline, 2);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Read baseline failed failed: %d", res);
		return res;
	}

	baseline->co2 = _baseline[0];
	baseline->tvoc = _baseline[1];

	return ESP_OK;
}

esp_err_t sgp30_write_baseline(i2c_handler_t * i2c, const sgp30_baseline_t * baseline) {
	uint8_t buffer[8] = {
		SGP30_COMMAND_WRITE_BASELINE[0], SGP30_COMMAND_WRITE_BASELINE[1],

		(uint8_t) (baseline->tvoc >> 8),
		(uint8_t) (baseline->tvoc & 0xFF),
		sgp30_crc(baseline->tvoc),

		(uint8_t) (baseline->co2 >> 8),
		(uint8_t) (baseline->co2 & 0xFF),
		sgp30_crc(baseline->co2)
	};

	esp_err_t res = i2c->write(SGP30_I2C_ADDRESS, buffer, 8);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant write baseline to sensor. %d", res);
	}

	return res;
}

esp_err_t sgp30_set_humidity(i2c_handler_t * i2c, double absolute_humidity) {
	uint16_t hum = (uint16_t) (absolute_humidity * 256);

	uint8_t buffer[5] = {
		SGP30_COMMAND_SET_HUMIDITY[0], SGP30_COMMAND_SET_HUMIDITY[1],

		(uint8_t) (hum >> 8),
		(uint8_t) (hum & 0xFF),
		sgp30_crc(hum)
	};

	esp_err_t res = i2c->write(SGP30_I2C_ADDRESS, buffer, 5);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant set humidity. res = %d", res);
	} else {
		ESP_LOGI(SGP30_LOG, "Applied humidity compensation: %.2f", absolute_humidity);
	}

	return res;
}

esp_err_t sgp30_write_init(i2c_handler_t * i2c) {
	esp_err_t res = i2c->write(SGP30_I2C_ADDRESS, SGP30_COMMAND_SOFT_RESET, 2);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant soft-reset sensor: %d", res);
	}

	sgp30_get_serial_id(i2c);
	sgp30_get_feature_set(i2c);

	res = i2c->write(SGP30_I2C_ADDRESS, SGP30_COMMAND_INIT, 2);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant init sensor: %d", res);
		return res;
	}

	sgp30_baseline_t baseline = { 0 };
	res = sgp30_nvs_read_baseline(&baseline);
	if (res) {
		ESP_LOGW(SGP30_LOG, "Cant read baseline from NVS: %d. Start calibration....", res);
	} else {
		ESP_LOGI(SGP30_LOG, "Baseline readed from VNS: tvoc = %d, co2 = %d", baseline.tvoc, baseline.co2);

		res = sgp30_write_baseline(i2c, &baseline);
		if (res == ESP_OK) {
			sgp30_init_status = SGP30_INIT_STATUS_INITIALIZED;
			ESP_LOGI(SGP30_LOG, "Driver initialized");
			return ESP_OK;
		} else {
			ESP_LOGW(SGP30_LOG, "Cant write baseline to sensor: %d. Start calibration", res);
		}
	}

	sgp30_init_status = SGP30_INIT_STATUS_INITIALIZING;

	xTaskCreate(sgp30_calibration_task, "calibration_task", SGP30_CALIBRATION_TASK_STACK_SIZE, i2c, 10, NULL);

	return ESP_OK;
}

esp_err_t sgp30_read(i2c_handler_t * i2c, sgp30_data_t * result) {
	if (sgp30_init_status != SGP30_INIT_STATUS_INITIALIZED) {
		ESP_LOGE(SGP30_LOG, "Driver not initialized. Init status == %d", sgp30_init_status);
		return ESP_FAIL;
	}

	return sgp30_read_internal(i2c, result, true);
}

esp_err_t sgp30_read_internal(i2c_handler_t * i2c, sgp30_data_t * result, bool query_raw_signals) {
	uint16_t buffer[2] = { 0x00 };
	esp_err_t res = sgp30_write_read_word(i2c, SGP30_COMMAND_READ, buffer, 2);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Read TVOC/eCO2 failed: %d", res);
		return res;
	}

	result->tvoc = buffer[1];
	result->eco2 = buffer[0];

	if (query_raw_signals) {
		res = sgp30_write_read_word(i2c, SGP30_COMMAND_READ_RAW, buffer, 2);
		if (res) {
			ESP_LOGE(SGP30_LOG, "Read h2/ethanol failed: %d", res);
			return res;
		}

		result->h2 = buffer[0];
		result->ethanol = buffer[1];
	} else {
		result->h2 = SGP30_VALUE_NODATA;
		result->ethanol = SGP30_VALUE_NODATA;
	}

	return ESP_OK;
}

esp_err_t sgp30_get_serial_id(i2c_handler_t * i2c) {
	uint16_t buffer[3] = { 0x00 };
	esp_err_t res = sgp30_write_read_word(i2c, SGP30_COMMAND_GET_SERIAL_ID, buffer, 3);
	if (res) {
		return res;
	}

    ESP_LOGI(SGP30_LOG, "Serial Number: %02x %02x %02x", buffer[0], buffer[1], buffer[2]);

    return ESP_OK;
}

esp_err_t sgp30_get_feature_set(i2c_handler_t * i2c) {
	uint16_t buffer = 0x00;
	esp_err_t res = sgp30_write_read_word(i2c, SGP30_COMMAND_GET_FEATURE_SET, &buffer, 1);
	if (res) {
		return res;
	}

    ESP_LOGI(SGP30_LOG, "Feature set: %02x", buffer);

    return ESP_OK;
}

esp_err_t sgp30_write_read_word(i2c_handler_t * i2c, const uint8_t * command, uint16_t * buffer, uint8_t buffer_size) {
	esp_err_t res = i2c->write(SGP30_I2C_ADDRESS, command, 2);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Write command %02x%02x failed: %d", command[0], command[1], res);
		return res;
	}

	vTaskDelay(20 / portTICK_PERIOD_MS);

	uint8_t * data = malloc(buffer_size * 3);
	res = i2c->read(SGP30_I2C_ADDRESS, data, buffer_size * 3);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Read command %02x%02x failed: %d", command[0], command[1], res);
		return res;
	}

	for (int i = 0; i<buffer_size; i++) {
		buffer[i] = data[i * 3] << 8 | data[i * 3 + 1];
		if (sgp30_crc(buffer[i]) != data[i * 3 + 2] && (buffer[i] != 0xFFFF || data[i * 3 + 2] != 0xFF)) {
			ESP_LOGE(SGP30_LOG, "Read word#%d failed. Invalid crc. %d != %d", i, sgp30_crc(buffer[i]), data[i * 3 + 2]);
			return ESP_ERR_INVALID_CRC;
		}
	}

	return ESP_OK;
}
