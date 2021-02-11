#ifndef MAIN_GPIO_ANEMOMETER_ANEMOMETER_DEF_H_
#define MAIN_GPIO_ANEMOMETER_ANEMOMETER_DEF_H_

#include "stdint.h"
#include "time.h"

#define ANEMOMETER_DIRECTION_NO_MOVERMENT 0
#define ANEMOMETER_DIRECTION_1 1
#define ANEMOMETER_DIRECTION_2 2
#define ANEMOMETER_UNKNOWN_VALUE -1000

#define ANEMOMETER_CALIBRATION_MAXROWS 20

typedef struct anemometer_calibration_table_row_t {
	float rps;   // rotates / sec
	float speed; // m / s
} anemometer_calibration_table_row_t;

typedef struct anemometer_calibration_table_t {
	anemometer_calibration_table_row_t* rows;
	uint8_t rows_count;
	float cross_sectional_area; // m^3/h or ANEMOMETER_UNKNOWN_VALUE
} anemometer_calibration_table_t;

typedef struct anemometer_data_t {
	float speed; // m/s or ANEMOMETER_UNKNOWN_VALUE
	float consumption; // m^3/h or ANEMOMETER_UNKNOWN_VALUE
	float raw_rps; // rotates / sec or ANEMOMETER_UNKNOWN_VALUE
	uint8_t direction; // ANEMOMETER_DIRECTION_1 / ANEMOMETER_DIRECTION_2 / ANEMOMETER_DIRECTION_NO_MOVERMENT
	time_t updated; // last_updated date
} anemometer_data_t;

typedef void (* anemometer_callback_t)(anemometer_data_t * state);

#endif /* MAIN_GPIO_ANEMOMETER_ANEMOMETER_DEF_H_ */
