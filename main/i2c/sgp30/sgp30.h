#ifndef MAIN_I2C_SGP30_SGP30_H_
#define MAIN_I2C_SGP30_SGP30_H_

#include "../i2c_impl.h"
#include "stdbool.h"

void sgp30_init(i2c_port_t port, const char* mqtt_topic, const char * command_topic);

void sgp30_init_auto_compensation();

#endif /* MAIN_I2C_SGP30_SGP30_H_ */
