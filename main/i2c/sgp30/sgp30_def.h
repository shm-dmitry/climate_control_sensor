#ifndef MAIN_I2C_SGP30_SGP30_DEF_H_
#define MAIN_I2C_SGP30_SGP30_DEF_H_

#include "stdint.h"

typedef struct sgp30_baseline_t {
	uint16_t tvoc;
	uint16_t co2;
} sgp30_baseline_t;

typedef struct sgp30_data_t {
	uint16_t tvoc;
	uint16_t eco2;
	uint16_t h2;
	uint16_t ethanol;
} sgp30_data_t;

#endif /* MAIN_I2C_SGP30_SGP30_DEF_H_ */
