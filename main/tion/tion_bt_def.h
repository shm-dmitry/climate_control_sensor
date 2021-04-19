#ifndef MAIN_TION_TION_BT_DEF_H_
#define MAIN_TION_TION_BT_DEF_H_

#include "esp_gattc_api.h"
#include "esp_gap_ble_api.h"

#define TION_EXEC_TIMEOUT 60 // seconds

#define PROFILE_APP_ID 0

static const char TION_DEVICE_NAME[] = "Tion Breezer 3S";

struct gattc_profile_inst {
	uint16_t gattc_if;
	uint16_t conn_id;
	uint16_t service_start_handle;
	uint16_t service_end_handle;
	esp_bd_addr_t remote_bda;

	uint16_t read_handle;
	uint16_t write_handle;
	uint16_t pair_handle;
};

#define TION_EXEC_COMMAND_PAIR 0
#define TION_EXEC_COMMAND_REQUEST_DATA 1
#define TION_EXEC_COMMAND_WAIT_TION_STATUS 2
#define TION_EXEC_COMMAND_WRITE_DATA 3

typedef struct tion_exec_command_t {
	uint8_t commands[10];
	uint8_t commands_size;
	uint8_t current_command;

	time_t started;

	tion_change_status_t new_status;
	tion_status_t * current_status;

	uint8_t retry_allowed_count;

	uint8_t command_uuid;
} tion_exec_command_t;

static esp_ble_scan_params_t ble_scan_params = {
		.scan_type = BLE_SCAN_TYPE_ACTIVE,
		.own_addr_type = BLE_ADDR_TYPE_PUBLIC,
		.scan_filter_policy = BLE_SCAN_FILTER_ALLOW_ALL,
		.scan_interval = 0x50,
		.scan_window = 0x30 };

static esp_bt_uuid_t tion_remote_service_uuid = {
// 6e400001-b5a3-f393-e0a9-e50e24dcca9e
		.len = ESP_UUID_LEN_128,
		.uuid = {
				.uuid128 = { 0x9e, 0xca, 0xdc, 0x24, 0x0e, 0xe5, 0xa9, 0xe0, 0x93, 0xf3, 0xa3, 0xb5, 0x01, 0x00, 0x40, 0x6e }
		},
};

 static esp_bt_uuid_t tion_remote_characteristics_write_uuid = {
 // 6e400002-b5a3-f393-e0a9-e50e24dcca9e
	 .len = ESP_UUID_LEN_128,
	 .uuid = {
			 .uuid128 = { 0x9e, 0xca, 0xdc, 0x24, 0x0e, 0xe5, 0xa9, 0xe0, 0x93, 0xf3, 0xa3, 0xb5, 0x02, 0x00, 0x40, 0x6e }
	 },
 };

static esp_bt_uuid_t tion_remote_characteristics_read_uuid = {
// 6e400003-b5a3-f393-e0a9-e50e24dcca9e
		.len = ESP_UUID_LEN_128,
		.uuid = {
				.uuid128 = { 0x9e, 0xca, 0xdc, 0x24, 0x0e, 0xe5, 0xa9, 0xe0, 0x93, 0xf3, 0xa3, 0xb5, 0x03, 0x00, 0x40, 0x6e }
		},
};


#endif /* MAIN_TION_TION_BT_DEF_H_ */
