#include "bme280_api.h"

#include "bme280_math.h"
#include "../../log.h"

#include "string.h"

// Thanks to https://github.com/letscontrolit/ESPEasy/blob/mega/src/src/PluginStructs/P028_data_struct.cpp
// Thanks to https://github.com/finitespace/BME280/blob/master/src/BME280.cpp

#define BME280_I2C_ADDRESS 0x76

#define REGISTER_CTRL_HUM   0xF2
#define REGISTER_CTRL_MEAS  0xF4
#define REGISTER_CONFIG     0xF5

#define REGISTER_PRESS	0xF7

#define SENSOR_DATA_LENGTH 8

static bme280_math_calibration_table_t * calibration_table = NULL;

esp_err_t bme280_write_register(i2c_handler_t * i2c, uint8_t register_id, uint8_t value);
esp_err_t bme280_read_registers(i2c_handler_t * i2c, uint8_t from_register_id, uint8_t * buffer, uint8_t buffer_size);
esp_err_t bme280_update_settings(i2c_handler_t * i2c);

double bme280_round(double value) {
	int32_t temp = value * 10;
	return (double) temp / 10.0;
}

esp_err_t bme280_read_calibration_table(i2c_handler_t * i2c) {
	uint8_t buffer_88[26] = { 0 };
	uint8_t buffer_e1[7] = { 0 };

	esp_err_t res = bme280_read_registers(i2c, 0x88, buffer_88, 26);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant read calibration table from address 0x88: %d", res);
		return res;
	}

	res = bme280_read_registers(i2c, 0xE1, buffer_e1, 7);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant read calibration table from address 0xE1: %d", res);
		return res;
	}

	calibration_table = bme280_math_init_calibration_table(buffer_88, buffer_e1);

/*
	ESP_LOGI(BME280_LOG, "CT: T1 = %d, T2 = %d, T3 = %d", calibration_table->dig_T1, calibration_table->dig_T2, calibration_table->dig_T3);
	ESP_LOGI(BME280_LOG, "CT: P1 = %d, P2 = %d, P3 = %d, P4 = %d, P5 = %d, P6 = %d, P7 = %d, P8 = %d, P9 = %d",
			  calibration_table->dig_P1, calibration_table->dig_P2, calibration_table->dig_P3
			, calibration_table->dig_P4, calibration_table->dig_P5, calibration_table->dig_P6
			, calibration_table->dig_P7, calibration_table->dig_P8, calibration_table->dig_P9);
	ESP_LOGI(BME280_LOG, "CT: H1 = %d, H2 = %d, H3 = %d, H4 = %d, H5 = %d, H6 = %d", calibration_table->dig_H1, calibration_table->dig_H2, calibration_table->dig_H3
			, calibration_table->dig_H4, calibration_table->dig_H5, calibration_table->dig_H6);
*/

	return res;
}

esp_err_t bme280_init_driver(i2c_handler_t * i2c) {
	esp_err_t res = bme280_read_calibration_table(i2c);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant read calibration table: %d", res);
		return res;
	}

	res = bme280_update_settings(i2c);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant wakeup sensor: %d", res);
		return res;
	}

	return ESP_OK;
}

esp_err_t bme280_read(i2c_handler_t * i2c, bme280_data_t * to) {
	if (calibration_table == NULL) {
		ESP_LOGE(BME280_LOG, "Driver not initialized.");
		return ESP_FAIL;
	}

	uint8_t buffer[SENSOR_DATA_LENGTH] = { 0 };

	esp_err_t err = bme280_read_registers(i2c, REGISTER_PRESS, buffer, SENSOR_DATA_LENGTH);
	if (err) {
		ESP_LOGE(BME280_LOG, "Cant read measurement: %d", err);
		return err;
	}

	int32_t raw_t = ((uint32_t) buffer[3] << 12) | ((uint32_t) buffer[4] << 4) | ((uint32_t) buffer[5] >> 4);
	int32_t raw_p = ((uint32_t) buffer[0] << 12) | ((uint32_t) buffer[1] << 4) | ((uint32_t) buffer[2] >> 4);
	int32_t raw_h = ((uint32_t) buffer[6] << 8)  | ((uint32_t) buffer[7]);

	int32_t t_fine = 0;
	to->temperature = bme280_round(bme280_math_calculate_temperature(raw_t, calibration_table, &t_fine));
	to->pressure = bme280_math_calculate_pressure(raw_p, calibration_table, &t_fine);
	to->humidity = bme280_round(bme280_math_calculate_humidity(raw_h, calibration_table, &t_fine));
	to->heatindex = bme280_math_calcilate_heatindex(to->temperature, to->humidity);
	to->absolute_humidity = bme280_round(bme280_math_absolute_humidity(to->temperature, to->humidity));

	return ESP_OK;
}

esp_err_t bme280_update_settings(i2c_handler_t * i2c) {
	bme280_settings_t settings = {
		.tosr = OSR_X1,
		.hosr = OSR_X1,
		.posr = OSR_X1,
		.mode = Mode_Normal,
		.time = StandbyTime_1000ms,
		.filter = Filter_Off
	};

	uint8_t ctrl_hum = settings.hosr;
	uint8_t ctrl_meas = (settings.tosr << 5) | (settings.posr << 2) | settings.mode;
	uint8_t config = settings.time << 5 | settings.filter << 2;

	esp_err_t res = bme280_write_register(i2c, REGISTER_CTRL_HUM, ctrl_hum);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant write to control register %02x value %02x", REGISTER_CTRL_HUM, ctrl_hum);
		return res;
	}

	res = bme280_write_register(i2c, REGISTER_CTRL_MEAS, ctrl_meas);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant write to control register %02x value %02x", REGISTER_CTRL_MEAS, ctrl_meas);
		return res;
	}

	res = bme280_write_register(i2c, REGISTER_CONFIG, config);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant write to control register %02x value %02x", REGISTER_CONFIG, config);
		return res;
	}

	return ESP_OK;
}

esp_err_t bme280_write_register(i2c_handler_t * i2c, uint8_t register_id, uint8_t value) {
	uint8_t buffer[2] = { register_id, value };
	esp_err_t res = i2c->write(BME280_I2C_ADDRESS, buffer, 2);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant write value %20x into register %02x: %d", value, register_id, res);
	}

	return res;
}

esp_err_t bme280_read_registers(i2c_handler_t * i2c, uint8_t from_register_id, uint8_t * buffer, uint8_t buffer_size) {
	esp_err_t res = i2c->write_read(BME280_I2C_ADDRESS, &from_register_id, 1, buffer, buffer_size);
	if (res) {
		ESP_LOGE(BME280_LOG, "Cant read register %02x: %d", from_register_id, res);
	}

	return res;
}
