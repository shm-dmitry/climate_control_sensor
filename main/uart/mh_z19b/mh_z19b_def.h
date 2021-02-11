#ifndef MAIN_MH_Z19B_MH_Z19B_DEF_H_
#define MAIN_MH_Z19B_MH_Z19B_DEF_H_

#include "stdint.h"

typedef enum mh_z19b_range {
	MHZ19B_RANGE_1000,
	MHZ19B_RANGE_2000,
	MHZ19B_RANGE_3000,
	MHZ19B_RANGE_5000,
	MHZ19B_RANGE_10000
} mh_z19b_range;

typedef struct mh_z19b_data_t {
	uint16_t co2;
	uint16_t min_co2;
	int8_t temperature;
	uint8_t accuracy;
} mh_z19b_data_t;

#endif /* MAIN_MH_Z19B_MH_Z19B_DEF_H_ */
