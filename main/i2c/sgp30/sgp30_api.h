#ifndef MAIN_I2C_SGP30_SGP30_API_H_
#define MAIN_I2C_SGP30_SGP30_API_H_

#include "../i2c_impl.h"
#include "sgp30_def.h"

// https://github.com/adafruit/Adafruit_SGP30
// https://github.com/sparkfun/SparkFun_SGP30_Arduino_Library/

#define SGP30_VALUE_NODATA 0xFFFF

esp_err_t sgp30_read_baseline(i2c_handler_t * i2c, sgp30_baseline_t * baseline);
esp_err_t sgp30_write_baseline(i2c_handler_t * i2c, const sgp30_baseline_t * baseline);

esp_err_t sgp30_set_humidity(i2c_handler_t * i2c, float absolute_humidity);

esp_err_t sgp30_write_init(i2c_handler_t * i2c);

esp_err_t sgp30_read(i2c_handler_t * i2c, sgp30_data_t * result);

#endif /* MAIN_I2C_SGP30_SGP30_API_H_ */
