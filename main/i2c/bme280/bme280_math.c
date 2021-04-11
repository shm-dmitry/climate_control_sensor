#include "bme280_math.h"

#include "stdlib.h"

#include "../../log.h"

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

bme280_math_calibration_table_t * bme280_math_init_calibration_table(uint8_t * buffer_88, uint8_t * buffer_e1) {
	bme280_math_calibration_table_t * calibration_table = malloc(sizeof(bme280_math_calibration_table_t));

	calibration_table->dig_T1 = (buffer_88[1] << 8)  | buffer_88[0];
	calibration_table->dig_T2 = (buffer_88[3] << 8)  | buffer_88[2];
	calibration_table->dig_T3 = (buffer_88[5] << 8)  | buffer_88[4];

	calibration_table->dig_P1 = (buffer_88[7] << 8)  | buffer_88[6];
	calibration_table->dig_P2 = (buffer_88[9] << 8)  | buffer_88[8];
	calibration_table->dig_P3 = (buffer_88[11] << 8) | buffer_88[10];
	calibration_table->dig_P4 = (buffer_88[13] << 8) | buffer_88[12];
	calibration_table->dig_P5 = (buffer_88[15] << 8) | buffer_88[14];
	calibration_table->dig_P6 = (buffer_88[17] << 8) | buffer_88[16];
	calibration_table->dig_P7 = (buffer_88[19] << 8) | buffer_88[18];
	calibration_table->dig_P8 = (buffer_88[21] << 8) | buffer_88[20];
	calibration_table->dig_P9 = (buffer_88[23] << 8) | buffer_88[22];

	calibration_table->dig_H1 = buffer_88[25];
	calibration_table->dig_H2 = (buffer_e1[1] << 8) | buffer_e1[0];
	calibration_table->dig_H3 = buffer_e1[2];
	calibration_table->dig_H4 = (buffer_e1[3] << 4) | (buffer_e1[4] & 0xF);
	calibration_table->dig_H5 = (buffer_e1[5] << 4) | (buffer_e1[4] >> 4);
	calibration_table->dig_H6 = buffer_e1[6];

	return calibration_table;
}

float bme280_math_calculate_temperature(int32_t adc_T,
		const bme280_math_calibration_table_t *calibration_table, int32_t *t_fine) {
	int32_t var1 = (((adc_T >> 3) - (calibration_table->dig_T1 << 1)) * calibration_table->dig_T2) >> 11;

	int32_t var2 = (((((adc_T >> 4) - calibration_table->dig_T1) * ((adc_T >> 4) - calibration_table->dig_T1)) >> 11) * calibration_table->dig_T3) >> 14;

	*t_fine = var1 + var2;

	float result = (*t_fine * 5 + 128) >> 8;

	return result / 100.0;
}

uint32_t bme280_math_calculate_pressure(int32_t adc_P,
		const bme280_math_calibration_table_t *calibration_table,
		const int32_t *t_fine) {
	int64_t var1, var2, p;

	var1 = *t_fine - 128000;
	var2 = var1 * var1 * (int64_t) calibration_table->dig_P6;
	var2 = var2 + ((var1 * (int64_t) calibration_table->dig_P5) << 17);
	var2 = var2 + (((int64_t) calibration_table->dig_P4) << 35);
	var1 = ((var1 * var1 * (int64_t) calibration_table->dig_P3) >> 8) + ((var1 * (int64_t) calibration_table->dig_P2) << 12);
	var1 = (((((int64_t) 1) << 47) + var1)) * ((int64_t) calibration_table->dig_P1) >> 33;

	if (var1 == 0) {
		return 0;
	}

	p = 1048576 - adc_P;
	p = (((p << 31) - var2) * 3125) / var1;
	var1 = (((int64_t) calibration_table->dig_P9) * (p >> 13) * (p >> 13)) >> 25;
	var2 = (((int64_t) calibration_table->dig_P8) * p) >> 19;

	p = ((p + var1 + var2) >> 8) + (((int64_t) calibration_table->dig_P7) << 4);

	return p / 256;
}

float bme280_math_calculate_humidity(int32_t adc_H,
		const bme280_math_calibration_table_t *calibration_table,
		const int32_t *t_fine) {
	  int32_t v_x1_u32r;

	  v_x1_u32r = *t_fine - 76800;

	  v_x1_u32r = (((((adc_H << 14) - (((int32_t)calibration_table->dig_H4) << 20) -
	                  (((int32_t)calibration_table->dig_H5) * v_x1_u32r)) + ((int32_t)16384)) >> 15) *
	               (((((((v_x1_u32r * ((int32_t)calibration_table->dig_H6)) >> 10) *
	                    (((v_x1_u32r * ((int32_t)calibration_table->dig_H3)) >> 11) + ((int32_t)32768))) >> 10) +
	                  ((int32_t)2097152)) * ((int32_t)calibration_table->dig_H2) + 8192) >> 14));

	  v_x1_u32r = (v_x1_u32r - (((((v_x1_u32r >> 15) * (v_x1_u32r >> 15)) >> 7) *
	                             ((int32_t)calibration_table->dig_H1)) >> 4));

	  v_x1_u32r = (v_x1_u32r < 0) ? 0 : v_x1_u32r;
	  v_x1_u32r = (v_x1_u32r > 419430400) ? 419430400 : v_x1_u32r;
	  float h = (v_x1_u32r >> 12);

	  return h / 1024.0f;
}

float bme280_math_calcilate_heatindex(float temperature, float humidity) {
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

float bme280_math_absolute_humidity(float temperature, float humidity) {
	float temp = pow(2.718281828, (17.67 * temperature) / (temperature + 243.5));
	return (6.112 * temp * humidity * MASS_OF_WATTER) / ((273.15 + temperature) * UNIV_GAZ_CONSTANT);
}
