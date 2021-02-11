#ifndef MAIN_I2C_BME280_BME280_API_H_
#define MAIN_I2C_BME280_BME280_API_H_

#include "../i2c_impl.h"

// based on https://github.com/finitespace/BME280/blob/master/src/BME280.cpp

typedef struct bme280_data_t {
	float temperature; // in °C
	float humidity;    // in %
	float pressure;    // in Pa
	float heatindex;   // in °C
	float absolute_humidity; // in grams/m³
} bme280_data_t;

typedef enum bme280_ocr
{
   OSR_Off =  0,
   OSR_X1  =  1,
   OSR_X2  =  2,
   OSR_X4  =  3,
   OSR_X8  =  4,
   OSR_X16 =  5
} bme280_ocr;

typedef enum bme280_mode
{
   Mode_Sleep  = 0,
   Mode_Forced = 1,
   Mode_Normal = 3
} bme280_mode;

typedef enum bme280_standby_time
{
   StandbyTime_500us   = 0,
   StandbyTime_62500us = 1,
   StandbyTime_125ms   = 2,
   StandbyTime_250ms   = 3,
   StandbyTime_50ms    = 4,
   StandbyTime_1000ms  = 5,
   StandbyTime_10ms    = 6,
   StandbyTime_20ms    = 7
} bme280_standby_time;

typedef enum bme280_filter
{
   Filter_Off = 0,
   Filter_2   = 1,
   Filter_4   = 2,
   Filter_8   = 3,
   Filter_16  = 4
} bme280_filter;

typedef struct bme280_settings_t {
	bme280_ocr tosr;
	bme280_ocr hosr;
	bme280_ocr posr;
	bme280_mode mode;
	bme280_standby_time time;
	bme280_filter filter;
} bme280_settings_t;

esp_err_t bme280_save_settings(i2c_handler_t * i2c, bme280_settings_t settings);

esp_err_t bme280_read(i2c_handler_t * i2c, bme280_data_t * to);

#endif /* MAIN_I2C_BME280_BME280_API_H_ */
