#include "bme280_api.h"

#include "string.h"
#include "math.h"

#define CTRL_HUM_ADDR   0xF2
#define CTRL_MEAS_ADDR  0xF4
#define CONFIG_ADDR     0xF5
#define PRESS_ADDR		0xF7
#define TEMP_DIG_ADDR   0x88
#define PRESS_DIG_ADDR  0x8E
#define HUM_DIG_ADDR1   0xA1
#define HUM_DIG_ADDR2   0xE1

#define TEMP_DIG_LENGTH      6
#define PRESS_DIG_LENGTH     18
#define HUM_DIG_ADDR1_LENGTH 1
#define HUM_DIG_ADDR2_LENGTH 7

#define SENSOR_DATA_LENGTH 8

#define HI_COEFF1 -42.379
#define HI_COEFF2   2.04901523
#define HI_COEFF3  10.14333127
#define HI_COEFF4  -0.22475541
#define HI_COEFF5  -0.00683783
#define HI_COEFF6  -0.05481717
#define HI_COEFF7   0.00122874
#define HI_COEFF8   0.00085282
#define HI_COEFF9  -0.00000199

#define MASS_OF_WATTER 18.01534
#define UNIV_GAZ_CONSTANT 8.31447215

uint8_t* basis = NULL;

esp_err_t init_basis(i2c_handler_t * i2c) {
	basis = malloc(TEMP_DIG_LENGTH + PRESS_DIG_LENGTH + HUM_DIG_ADDR1_LENGTH + HUM_DIG_ADDR2_LENGTH);

	uint8_t ord = 0;

	esp_err_t err1 = i2c->read(TEMP_DIG_ADDR, &basis[ord], TEMP_DIG_LENGTH);
	ord += TEMP_DIG_LENGTH;

	esp_err_t err2 = i2c->read(PRESS_DIG_ADDR, &basis[ord], PRESS_DIG_LENGTH);
	ord += PRESS_DIG_LENGTH;

	esp_err_t err3 = i2c->read(HUM_DIG_ADDR1, &basis[ord], HUM_DIG_ADDR1_LENGTH);
	ord += HUM_DIG_ADDR1_LENGTH;

	esp_err_t err4 = i2c->read(HUM_DIG_ADDR2, &basis[ord], HUM_DIG_ADDR2_LENGTH);

	if (err1 || err2 || err3 || err4) {
		free(basis);
		basis = NULL;
	}

	if (err1) {
		return err1;
	}
	if (err2) {
		return err2;
	}
	if (err3) {
		return err3;
	}

	return err4;
}

float calculate_temperature(const uint32_t * buffer, int32_t * t_fine) {
	uint32_t raw   = (buffer[3] << 12) | (buffer[4] << 4) | (buffer[5] >> 4);

	uint16_t dig_T1 = (basis[1] << 8) | basis[0];
	int16_t dig_T2  = (basis[3] << 8) | basis[2];
	int16_t dig_T3  = (basis[5] << 8) | basis[4];
	int32_t var1 = ((((raw >> 3) - ((int32_t) dig_T1 << 1))) * ((int32_t) dig_T2)) >> 11;
	int32_t var2 = (((((raw >> 4) - ((int32_t) dig_T1)) * ((raw >> 4) - ((int32_t) dig_T1))) >> 12) * ((int32_t) dig_T3)) >> 14;
	*t_fine = var1 + var2;
	int32_t result = (*t_fine * 5 + 128) >> 8;

	return result / 100.0;
}

float calculate_pressure(const uint32_t * buffer, const int32_t * t_fine) {
	uint32_t raw = (buffer[0] << 12) | (buffer[1] << 4) | (buffer[2] >> 4);

	uint16_t dig_P1 = (basis[7] << 8) | basis[6];
	int16_t dig_P2  = (basis[9] << 8) | basis[8];
	int16_t dig_P3  = (basis[11] << 8) | basis[10];
	int16_t dig_P4  = (basis[13] << 8) | basis[12];
	int16_t dig_P5  = (basis[15] << 8) | basis[14];
	int16_t dig_P6  = (basis[17] << 8) | basis[16];
	int16_t dig_P7  = (basis[19] << 8) | basis[18];
	int16_t dig_P8  = (basis[21] << 8) | basis[20];
	int16_t dig_P9  = (basis[23] << 8) | basis[22];


	int64_t var1 = (int64_t) *t_fine - 128000;
	int64_t var2 = var1 * var1 * (int64_t) dig_P6;
	var2 = var2 + ((var1 * (int64_t) dig_P5) << 17);
	var2 = var2 + (((int64_t) dig_P4) << 35);
	var1 = ((var1 * var1 * (int64_t) dig_P3) >> 8) + ((var1 * (int64_t) dig_P2) << 12);
	var1 = (((((int64_t) 1) << 47) + var1)) * ((int64_t) dig_P1) >> 33;
	if (var1 == 0) {
		return NAN;
	}
	int64_t pressure = 1048576 - raw;
	pressure = (((pressure << 31) - var2) * 3125) / var1;
	var1 = (((int64_t) dig_P9) * (pressure >> 13) * (pressure >> 13)) >> 25;
	var2 = (((int64_t) dig_P8) * pressure) >> 19;
	pressure = ((pressure + var1 + var2) >> 8) + (((int64_t) dig_P7) << 4);

	return ((uint32_t)pressure)/256.0;
}

float calculate_humidity(const uint32_t * buffer, const int32_t * t_fine) {
	uint32_t raw = (buffer[6] << 8) | buffer[7];

	uint8_t dig_H1 = basis[24];
	int16_t dig_H2 = (basis[26] << 8) | basis[25];
	uint8_t dig_H3 = basis[27];
	int16_t dig_H4 = (basis[28] << 4) | (0x0F & basis[29]);
	int16_t dig_H5 = (basis[30] << 4) | ((basis[29] >> 4) & 0x0F);
	int8_t dig_H6 = basis[31];

	int32_t var1 = (*t_fine - ((int32_t) 76800));
	var1 = (((((raw << 14) - (((int32_t)dig_H4) << 20) - (((int32_t)dig_H5) * var1)) +
	   ((int32_t)16384)) >> 15) * (((((((var1 * ((int32_t)dig_H6)) >> 10) * (((var1 *
	   ((int32_t)dig_H3)) >> 11) + ((int32_t)32768))) >> 10) + ((int32_t)2097152)) *
	   ((int32_t)dig_H2) + 8192) >> 14));
	var1 = (var1 - (((((var1 >> 15) * (var1 >> 15)) >> 7) * ((int32_t) dig_H1)) >> 4));
	var1 = (var1 < 0 ? 0 : var1);
	var1 = (var1 > 419430400 ? 419430400 : var1);

	return ((uint32_t)(var1 >> 12))/1024.0;
}

float calcilate_heatindex(float temperature, float humidity) {
	float heat_index = 0;

	temperature = (temperature * (9.0 / 5.0) + 32.0);

	if (temperature <= 40) {
		heat_index = temperature;
	} else {
		heat_index = 0.5 * (temperature + 61.0 + ((temperature - 68.0) * 1.2) + (humidity * 0.094));
		if (heat_index >= 79) {
			heat_index = HI_COEFF1 + (HI_COEFF2 + HI_COEFF4 * humidity + temperature * (HI_COEFF5 + HI_COEFF7 * humidity)) * temperature
					+ (HI_COEFF3 + humidity * (HI_COEFF6 + temperature * (HI_COEFF8 + HI_COEFF9 * temperature))) * humidity;
			if ((humidity < 13) && (temperature >= 80.0) && (temperature <= 112.0)) {
				heat_index -= ((13.0 - humidity) * 0.25) * sqrt((17.0 - abs(temperature - 95.0)) * 0.05882);
			} else if ((humidity > 85.0) && (temperature >= 80.0) && (temperature <= 87.0)) {
				heat_index += (0.02 * (humidity - 85.0) * (87.0 - temperature));
			}
		}
	}

    return (heat_index - 32.0) * (5.0 / 9.0);
}

float absolute_humidity(float temperature, float humidity) {
	float temp = pow(2.718281828, (17.67 * temperature) / (temperature + 243.5));
	return (6.112 * temp * humidity * MASS_OF_WATTER) / ((273.15 + temperature) * UNIV_GAZ_CONSTANT);
}

esp_err_t bme280_read(i2c_handler_t * i2c, bme280_data_t * to) {
	if (basis == NULL) {
		esp_err_t err = init_basis(i2c);
		if (err) {
			return err;
		}
	}

	uint8_t buffer_8[SENSOR_DATA_LENGTH] = { 0 };

	esp_err_t err = i2c->read(PRESS_ADDR, buffer_8, SENSOR_DATA_LENGTH);
	if (err) {
		return err;
	}

	uint32_t buffer[SENSOR_DATA_LENGTH] = { 0 };
	for (int i = 0; i<SENSOR_DATA_LENGTH; i++) {
		buffer[i] = buffer_8[i];
	}

	int32_t t_fine = 0;
	to->temperature = calculate_temperature(buffer, &t_fine);
	to->pressure = calculate_pressure(buffer, &t_fine);
	to->humidity = calculate_humidity(buffer, &t_fine);
	to->heatindex = calcilate_heatindex(to->temperature, to->humidity);
	to->absolute_humidity = absolute_humidity(to->temperature, to->humidity);

	return ESP_OK;
}

esp_err_t bme280_save_settings(i2c_handler_t * i2c, bme280_settings_t settings) {
	uint8_t ctrl_hum = settings.hosr;
	uint8_t ctrl_meas = (settings.tosr << 5) | (settings.posr << 2) | settings.mode;
	uint8_t config = settings.time << 5 | settings.filter << 2;

	esp_err_t err1 = i2c->write(CTRL_HUM_ADDR, &ctrl_hum, 1);
	esp_err_t err2 = i2c->write(CTRL_MEAS_ADDR, &ctrl_meas, 1);
	esp_err_t err3 = i2c->write(CONFIG_ADDR, &config, 1);

	if (err1) {
		return err1;
	}
	if (err2) {
		return err2;
	}

	return err3;
}
