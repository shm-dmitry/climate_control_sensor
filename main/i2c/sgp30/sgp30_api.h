#ifndef MAIN_I2C_SGP30_SGP30_API_H_
#define MAIN_I2C_SGP30_SGP30_API_H_

#include "../i2c_impl.h"

// https://github.com/adafruit/Adafruit_SGP30
// https://github.com/sparkfun/SparkFun_SGP30_Arduino_Library/

typedef struct sgp30_data_t {
	uint16_t tvoc;
	uint16_t eco2;
	uint16_t h2;
	uint16_t ethanol;
} sgp30_data_t;

typedef struct sgp30_baseline_t {
	uint16_t tvoc;
	uint16_t co2;
} sgp30_baseline_t;

esp_err_t sgp30_read_baseline(i2c_handler_t * i2c, sgp30_baseline_t * baseline);
esp_err_t sgp30_write_baseline(i2c_handler_t * i2c, const sgp30_baseline_t * baseline);

esp_err_t sgp30_set_humidity(i2c_handler_t * i2c, float absolute_humidity);

esp_err_t sgp30_write_init(i2c_handler_t * i2c);

esp_err_t sgp30_read(i2c_handler_t * i2c, sgp30_data_t * result);

#endif /* MAIN_I2C_SGP30_SGP30_API_H_ */
