#ifndef MAIN_I2C_BME280_BME280_MATH_H_
#define MAIN_I2C_BME280_BME280_MATH_H_

#include "stdint.h"
#include "math.h"

typedef struct bme280_math_calibration_table_t {
	int16_t dig_T1;
	int16_t  dig_T2;
	int16_t  dig_T3;

	uint16_t dig_P1;
	int16_t  dig_P2;
	int16_t  dig_P3;
	int16_t  dig_P4;
	int16_t  dig_P5;
	int16_t  dig_P6;
	int16_t  dig_P7;
	int16_t  dig_P8;
	int16_t  dig_P9;

	uint8_t dig_H1;
	int16_t dig_H2;
	uint8_t dig_H3;
	int16_t dig_H4;
	int16_t dig_H5;
	int8_t  dig_H6;
} bme280_math_calibration_table_t;

bme280_math_calibration_table_t * bme280_math_init_calibration_table(uint8_t * buffer_88, uint8_t * buffer_e1);

float bme280_math_calculate_temperature(int32_t raw, const bme280_math_calibration_table_t* calibration_table, int32_t * t_fine);

uint32_t bme280_math_calculate_pressure(int32_t raw, const bme280_math_calibration_table_t* calibration_table, const int32_t * t_fine);

float bme280_math_calculate_humidity(int32_t raw, const bme280_math_calibration_table_t* calibration_table, const int32_t * t_fine);

float bme280_math_calcilate_heatindex(float temperature, float humidity);

float bme280_math_absolute_humidity(float temperature, float humidity);

#endif /* MAIN_I2C_BME280_BME280_MATH_H_ */
