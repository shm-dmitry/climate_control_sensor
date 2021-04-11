#ifndef MAIN_I2C_I2C_IMPL_H_
#define MAIN_I2C_I2C_IMPL_H_

#include "stdint.h"
#include "esp_err.h"
#include "driver/i2c.h"

typedef esp_err_t (* i2c_read_function)(uint8_t addr_id, uint8_t* buffer, uint8_t buffer_size);
typedef esp_err_t (* i2c_write_function)(uint8_t addr_id, const uint8_t* buffer, uint8_t buffer_size);
typedef esp_err_t (* i2c_write_read_function)(uint8_t addr_id, const uint8_t* write_buffer, uint8_t write_buffer_size, uint8_t* read_buffer, uint8_t read_buffer_size);

typedef struct i2c_handler_t {
	i2c_read_function read;
	i2c_write_function write;
	i2c_write_read_function write_read;
} i2c_handler_t;

void i2c_register_port(i2c_port_t port, int gpio_sda, int gpio_scl);

i2c_handler_t * i2c_get_handlers(i2c_port_t port);

#endif /* MAIN_I2C_I2C_IMPL_H_ */
