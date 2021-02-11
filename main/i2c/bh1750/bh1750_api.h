#ifndef MAIN_I2C_BH1750_BH1750_API_H_
#define MAIN_I2C_BH1750_BH1750_API_H_

#include "../i2c_impl.h"

esp_err_t bh1750_configure(i2c_handler_t * i2c);

esp_err_t bh1750_read(i2c_handler_t * i2c, float * result);

#endif /* MAIN_I2C_BH1750_BH1750_API_H_ */
