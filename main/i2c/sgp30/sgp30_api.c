#include "sgp30_api.h"

#define SGP30_ADDRESS 0x58

const uint8_t SGP30_COMMAND_INIT[] = { 0x20, 0x03 };
const uint8_t SGP30_COMMAND_READ[] = { 0x20, 0x08 };
const uint8_t SGP30_COMMAND_READ_RAW[] = { 0x20, 0x50 };
const uint8_t SGP30_COMMAND_READ_BASELINE[] = { 0x20, 0x15 };
const uint8_t SGP30_COMMAND_WRITE_BASELINE[] = { 0x20, 0x1E };
const uint8_t SGP30_COMMAND_SET_HUMIDITY[] = { 0x20, 0x61 };

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

esp_err_t sgp30_read_baseline(i2c_handler_t * i2c, sgp30_baseline_t * baseline) {
	uint8_t buffer[6];

	esp_err_t res = i2c->write_read(SGP30_ADDRESS, SGP30_COMMAND_READ_BASELINE, 2, SGP30_ADDRESS, buffer, 6);
	if (res) {
		return res;
	}

	uint16_t _baselineCO2 = buffer[0] << 8 | buffer[1];
	if (sgp30_crc(_baselineCO2) != buffer[2]) {
		return ESP_ERR_INVALID_CRC;
	}

	uint16_t _baselineTVOC = buffer[3] << 8 | buffer[4];
	if (sgp30_crc(_baselineTVOC) != buffer[5]) {
		return ESP_ERR_INVALID_CRC;
	}

	baseline->co2 = _baselineCO2;
	baseline->tvoc = _baselineTVOC;

	return ESP_OK;
}

esp_err_t sgp30_write_baseline(i2c_handler_t * i2c, const sgp30_baseline_t * baseline) {
	uint8_t buffer[10] = {
		SGP30_COMMAND_WRITE_BASELINE[0], SGP30_COMMAND_WRITE_BASELINE[1],

		(uint8_t) baseline->tvoc >> 8,
		(uint8_t) baseline->tvoc,
		sgp30_crc(baseline->tvoc),

		(uint8_t) baseline->co2 >> 8,
		(uint8_t) baseline->co2,
		sgp30_crc(baseline->co2)
	};

	return i2c->write(SGP30_ADDRESS, buffer, 10);
}

esp_err_t sgp30_set_humidity(i2c_handler_t * i2c, float absolute_humidity) {
	uint16_t hum = (uint16_t) (absolute_humidity * 256);

	uint8_t buffer[5] = {
		SGP30_COMMAND_SET_HUMIDITY[0], SGP30_COMMAND_SET_HUMIDITY[1],

		(uint8_t) hum >> 8,
		(uint8_t) hum,
		sgp30_crc(hum)
	};

	return i2c->write(SGP30_ADDRESS, buffer, 5);
}

esp_err_t sgp30_write_init(i2c_handler_t * i2c) {
	return i2c->write(SGP30_ADDRESS, SGP30_COMMAND_INIT, 2);
}

esp_err_t sgp30_read(i2c_handler_t * i2c, sgp30_data_t * result) {
	uint8_t tvoc_eco2[6] = { 0 };
	uint8_t h2_ethanol[6] = { 0 };

	esp_err_t res = i2c->write_read(SGP30_ADDRESS, SGP30_COMMAND_READ, 2, SGP30_ADDRESS, tvoc_eco2, 6);
	if (res) {
		return res;
	}

	uint16_t tvoc = tvoc_eco2[0] << 8 | tvoc_eco2[1];
	uint16_t eco2 = tvoc_eco2[3] << 8 | tvoc_eco2[4];
	if (sgp30_crc(tvoc) != tvoc_eco2[2]) {
		return ESP_ERR_INVALID_CRC;
	}
	if (sgp30_crc(eco2) != tvoc_eco2[5]) {
		return ESP_ERR_INVALID_CRC;
	}

	i2c->write_read(SGP30_ADDRESS, SGP30_COMMAND_READ_RAW, 2, SGP30_ADDRESS, h2_ethanol, 6);
	if (res) {
		return res;
	}

	uint16_t h2 = h2_ethanol[0] << 8 | h2_ethanol[1];
	uint16_t ethanol = h2_ethanol[3] << 8 | h2_ethanol[4];
	if (sgp30_crc(h2) != h2_ethanol[2]) {
		return ESP_ERR_INVALID_CRC;
	}
	if (sgp30_crc(ethanol) != h2_ethanol[5]) {
		return ESP_ERR_INVALID_CRC;
	}

	result->tvoc = tvoc;
	result->eco2 = eco2;
	result->h2 = h2;
	result->ethanol = ethanol;

	return ESP_OK;
}
