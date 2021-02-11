#ifndef MAIN_I2C_BH1750_BH1750_H_
#define MAIN_I2C_BH1750_BH1750_H_

#include "../i2c_impl.h"

void bh1750_init(i2c_port_t port, const char* mqtt_topic);

#endif /* MAIN_I2C_BH1750_BH1750_H_ */
