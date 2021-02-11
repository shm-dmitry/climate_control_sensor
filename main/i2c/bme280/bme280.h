#ifndef MAIN_I2C_BME280_BME280_H_
#define MAIN_I2C_BME280_BME280_H_

#include "../i2c_impl.h"

void bme280_init(i2c_port_t port, const char* mqtt_topic);

esp_err_t bme280_read_absolute_humidity(float * absolute_humidity);

#endif /* MAIN_I2C_BME280_BME280_H_ */
