#ifndef MAIN_TION_TION_DATA_H_
#define MAIN_TION_TION_DATA_H_

#include "stdbool.h"
#include "stdint.h"
#include "time.h"

#define TION_MODE_RECIRCULATION 0
#define TION_MODE_MIXED 1
#define TION_MODE_OUTDOOR 2

typedef struct tion_status_t {
	uint8_t fan_spped;
	uint8_t mode;
	bool heater;
	bool state;
	uint8_t target_temperature;
	bool sound;

	int8_t outdoor_temperature;
	int8_t indoor_temperature;
	uint16_t filter_remain;
	uint8_t error_code;
	bool timer;
	uint16_t time;
	uint8_t productivity;
	uint16_t fw_version;

	uint32_t check_sum;
	time_t updated;
} tion_status_t;

#define CHANGE_STATUS_NOT_SET 250
#define CHANGE_STATUS_TRUE 1
#define CHANGE_STATUS_FALSE 0
#define CHANGE_STATUS_INVALID_CHECKSUM 0xFFFFFFFF

typedef struct tion_change_status_t {
	uint8_t fan_speed;
	uint8_t target_temperature;
	uint8_t mode;

	uint8_t heater; // bool: CHANGE_STATUS_FALSE / CHANGE_STATUS_TRUE / CHANGE_STATUS_NOT_SET
	uint8_t state; // bool: CHANGE_STATUS_FALSE / CHANGE_STATUS_TRUE / CHANGE_STATUS_NOT_SET
	uint8_t sound; // bool: CHANGE_STATUS_FALSE / CHANGE_STATUS_TRUE / CHANGE_STATUS_NOT_SET

	uint32_t check_sum; // check sum / CHANGE_STATUS_INVALID_CHECKSUM
} tion_change_status_t;

#endif /* MAIN_TION_TION_DATA_H_ */
