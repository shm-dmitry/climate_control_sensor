#ifndef MAIN_TION_TION_BT_COMMAND_H_
#define MAIN_TION_TION_BT_COMMAND_H_

#include "esp_gattc_api.h"
#include "esp_gap_ble_api.h"

#include "tion_data.h"

#define TION_BT_EXEC_COMMAND_PAIR 0
#define TION_BT_EXEC_COMMAND_REQUEST_DATA 1
#define TION_BT_EXEC_COMMAND_WAIT_TION_STATUS 2
#define TION_BT_EXEC_COMMAND_WRITE_DATA 3

typedef struct tion_bt_exec_command_t {
	uint8_t commands[10];
	uint8_t commands_size;
	uint8_t current_command;

	time_t started;

	tion_change_status_t new_status;
	tion_status_t * current_status;

	uint8_t retry_allowed_count;

	uint8_t command_uuid;
} tion_exec_command_t;

#endif /* MAIN_TION_TION_BT_COMMAND_H_ */
