#include "tion_bt.h"

#include "tion_api.h"
#include "../log.h"
#include "tion_bt_def.h"

#include "esp_bt.h"
#include "esp_gatt_defs.h"
#include "esp_bt_main.h"
#include "esp_gatt_common_api.h"
#include "freertos/FreeRTOS.h"

#include <unistd.h>
#include <string.h>
#include "time.h"

#define TION_RETRY_SLEEP 5 * 100000 // 0.5 sec
#define PAIR_RETRY_ALLOWED 100
#define WRITE_RETRY_ALLOWED 3
#define GET_STATUS_RETRY_ALLOWED 3

static void bt_gap_cb(esp_gap_ble_cb_event_t event, esp_ble_gap_cb_param_t *param);
static void bt_gattc_cb(esp_gattc_cb_event_t event, esp_gatt_if_t gattc_if, esp_ble_gattc_cb_param_t *param);

static void bt_start();
static void bt_stop(bool, bool);

static struct gattc_profile_inst gl_profile_tab = {
		.gattc_cb = bt_gattc_cb,
		.gattc_if = ESP_GATT_IF_NONE, /* Not get the gatt_if, so initial is ESP_GATT_IF_NONE */

		.read_handle = ESP_GATT_ILLEGAL_HANDLE,
		.write_handle = ESP_GATT_ILLEGAL_HANDLE,
		.pair_handle = ESP_GATT_ILLEGAL_HANDLE
};

static struct tion_exec_command_t* tion_exec_command = NULL;\
static tion_status_callback_t status_callback;

void tion_register_status_callback(tion_status_callback_t callback) {
	status_callback = callback;
}

bool prepare_tion_exec_command(uint8_t retry_allowed_count) {
	if (tion_exec_command) {
		time_t started = tion_exec_command->started;

		time_t now;
		time(&now);

		if (now - started > TION_EXEC_TIMEOUT) {
			bt_stop(true, false);
		} else {
			return false;
		}
	}

	tion_exec_command = (tion_exec_command_t *) malloc(sizeof(tion_exec_command_t));
	memset((void *)tion_exec_command, 0, sizeof(tion_exec_command_t));
	time(&tion_exec_command->started);
	tion_exec_command->retry_allowed_count = retry_allowed_count;

	return true;
}

bool check_can_send_command(tion_change_status_t * corrected) {
	bool has_current_status = tion_exec_command->current_status == NULL;

	// check check-sum
	if (tion_exec_command->new_status.check_sum != CHANGE_STATUS_INVALID_CHECKSUM) {
		if (has_current_status) {
			if (tion_exec_command->new_status.check_sum != tion_exec_command->current_status->check_sum) {
				ESP_LOGW(TION_LOG_TAG, "check_can_send_command checksum invalid: passed %d awaited %d", tion_exec_command->new_status.check_sum, tion_exec_command->current_status->check_sum);
				return false;
			} else {
				corrected->check_sum = tion_exec_command->new_status.check_sum;
			}
		} else {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant check checksum - no current status.");
			return false; // cant check check-sum, so exit
		}
	} else {
		if (has_current_status) {
			corrected->check_sum = tion_exec_command->current_status->check_sum;
		} else {
			corrected->check_sum = CHANGE_STATUS_INVALID_CHECKSUM;
		}
	}

	// check other fields and setup default values if need
	if (tion_exec_command->new_status.fan_speed == CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant setup default fan_speed - no current status.");
			return false;
		} else {
			corrected->fan_speed = tion_exec_command->current_status->fan_spped;
		}
	} else {
		corrected->fan_speed = tion_exec_command->new_status.fan_speed;
	}

	if (tion_exec_command->new_status.target_temperature == CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant setup default target_temperature - no current status.");
			return false;
		} else {
			corrected->target_temperature = tion_exec_command->current_status->target_temperature;
		}
	} else {
		corrected->target_temperature = tion_exec_command->new_status.target_temperature;
	}

	if (tion_exec_command->new_status.mode == CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant setup default mode - no current status.");
			return false;
		} else {
			corrected->mode = tion_exec_command->current_status->mode;
		}
	} else {
		corrected->mode = tion_exec_command->new_status.mode;
	}

	if (tion_exec_command->new_status.heater == CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant setup default heater - no current status.");
			return false;
		} else {
			corrected->heater = tion_exec_command->current_status->heater ? CHANGE_STATUS_TRUE : CHANGE_STATUS_FALSE;
		}
	} else {
		corrected->heater = tion_exec_command->new_status.heater ? CHANGE_STATUS_TRUE : CHANGE_STATUS_FALSE;
	}

	if (tion_exec_command->new_status.state == CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant setup default state - no current status.");
			return false;
		} else {
			corrected->state = tion_exec_command->current_status->state ? CHANGE_STATUS_TRUE : CHANGE_STATUS_FALSE;
		}
	} else {
		corrected->state = tion_exec_command->new_status.state ? CHANGE_STATUS_TRUE : CHANGE_STATUS_FALSE;
	}

	if (tion_exec_command->new_status.sound == CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG_TAG, "check_can_send_command cant setup default sound - no current status.");
			return false;
		} else {
			corrected->sound = tion_exec_command->current_status->sound ? CHANGE_STATUS_TRUE : CHANGE_STATUS_FALSE;
		}
	} else {
		corrected->sound = tion_exec_command->new_status.sound ? CHANGE_STATUS_TRUE : CHANGE_STATUS_FALSE;
	}

	return true;
}

void execute_tion_command() {
	if (tion_exec_command->current_command >= tion_exec_command->commands_size) {
		bt_stop(true, false);
		return;
	}

	esp_err_t result;
	uint8_t command = tion_exec_command->commands[tion_exec_command->current_command];
	switch (command) {
	case TION_EXEC_COMMAND_PAIR:
		result = send_pair_command(gl_profile_tab.gattc_if, gl_profile_tab.conn_id, gl_profile_tab.pair_handle);
		tion_exec_command->current_command++;
		break;
	case TION_EXEC_COMMAND_REQUEST_DATA:
		if (tion_exec_command->current_status != NULL) {
			free(tion_exec_command->current_status);
			tion_exec_command->current_status = NULL;
		}

		result = send_request_data_command(gl_profile_tab.gattc_if, gl_profile_tab.conn_id, gl_profile_tab.write_handle);
		tion_exec_command->current_command++;
		break;
	case TION_EXEC_COMMAND_WAIT_TION_STATUS:
		if (tion_exec_command->current_status != NULL) {
			tion_exec_command->current_command++;
		}
		result = ESP_OK;
		break;
	case TION_EXEC_COMMAND_WRITE_DATA: {
		tion_change_status_t newstatus;
		memset(&newstatus, CHANGE_STATUS_NOT_SET, sizeof(tion_change_status_t));

		if (check_can_send_command(&newstatus)) {
			result = send_write_data_command(gl_profile_tab.gattc_if, gl_profile_tab.conn_id, gl_profile_tab.write_handle, newstatus);
		} else {
			result = ESP_OK;
		}
		tion_exec_command->current_command++;
	}
		break;
	default:
		result = ESP_FAIL;
		break;
	}

	if (result) {
		ESP_LOGE(TION_LOG_TAG, "Cant send command %d to TION. error_code %d", command, result);
		bt_stop(true, true);
	}
}

void tion_pair() {
	if (!prepare_tion_exec_command(PAIR_RETRY_ALLOWED)) {
		return;
	}

	tion_exec_command->commands_size = 3;
	tion_exec_command->commands[0] = TION_EXEC_COMMAND_PAIR;
	tion_exec_command->commands[1] = TION_EXEC_COMMAND_REQUEST_DATA;
	tion_exec_command->commands[2] = TION_EXEC_COMMAND_WAIT_TION_STATUS;

	bt_start();
}

void tion_write_new_status(tion_change_status_t status) {
	if (!prepare_tion_exec_command(WRITE_RETRY_ALLOWED)) {
		return;
	}

	if (status.check_sum != 0) {
		tion_exec_command->commands_size = 5;
		tion_exec_command->commands[0] = TION_EXEC_COMMAND_REQUEST_DATA;
		tion_exec_command->commands[1] = TION_EXEC_COMMAND_WAIT_TION_STATUS;
		tion_exec_command->commands[2] = TION_EXEC_COMMAND_WRITE_DATA;
		tion_exec_command->commands[3] = TION_EXEC_COMMAND_REQUEST_DATA;
		tion_exec_command->commands[4] = TION_EXEC_COMMAND_WAIT_TION_STATUS;
	} else {
		tion_exec_command->commands_size = 3;
		tion_exec_command->commands[0] = TION_EXEC_COMMAND_WRITE_DATA;
		tion_exec_command->commands[1] = TION_EXEC_COMMAND_REQUEST_DATA;
		tion_exec_command->commands[2] = TION_EXEC_COMMAND_WAIT_TION_STATUS;
	}

	bt_start();
}

void tion_request_status() {
	if (!prepare_tion_exec_command(GET_STATUS_RETRY_ALLOWED)) {
		return;
	}

	tion_exec_command->commands_size = 2;
	tion_exec_command->commands[0] = TION_EXEC_COMMAND_REQUEST_DATA;
	tion_exec_command->commands[1] = TION_EXEC_COMMAND_WAIT_TION_STATUS;

	bt_start();
}

void bt_stop(bool stopBT, bool allow_retry) {
	if (!tion_exec_command) {
		return;
	}

	if (tion_exec_command->current_status != NULL) {
		if (status_callback != NULL) {
			status_callback(tion_exec_command->current_status);
		}

		free(tion_exec_command->current_status);
		tion_exec_command->current_status = NULL;
	}

	if (allow_retry && tion_exec_command->retry_allowed_count > 0) {
		tion_exec_command->retry_allowed_count--;
		usleep(TION_RETRY_SLEEP);
	} else {
		free(tion_exec_command);
		tion_exec_command = NULL;
	}

	if (stopBT) {
		if (gl_profile_tab.gattc_if && gl_profile_tab.conn_id) {
			esp_ble_gattc_close(gl_profile_tab.gattc_if, gl_profile_tab.conn_id);
		}

		esp_ble_gattc_app_unregister(PROFILE_APP_ID);

		gl_profile_tab.gattc_if = ESP_GATT_IF_NONE;
		gl_profile_tab.read_handle = ESP_GATT_ILLEGAL_HANDLE;
		gl_profile_tab.write_handle = ESP_GATT_ILLEGAL_HANDLE;
		gl_profile_tab.pair_handle = ESP_GATT_ILLEGAL_HANDLE;
	}
}

void bt_start() {
	if (!tion_exec_command) {
		return;
	}

	esp_bt_controller_config_t bt_cfg = BT_CONTROLLER_INIT_CONFIG_DEFAULT();

	if (esp_bt_controller_init(&bt_cfg)) {
		ESP_LOGE(TION_LOG_TAG, "esp_bt_controller_init failed");
		bt_stop(false, false);
		return;
	}

	if (esp_bt_controller_enable(ESP_BT_MODE_BLE)) {
		ESP_LOGE(TION_LOG_TAG, "esp_bt_controller_enable failed");
		bt_stop(false, false);
		return;
	}

	if (esp_bluedroid_init()) {
		ESP_LOGE(TION_LOG_TAG, "esp_bluedroid_init failed");
		bt_stop(false, false);
		return;
	}

	if (esp_bluedroid_enable()) {
		ESP_LOGE(TION_LOG_TAG, "esp_bluedroid_enable failed");
		bt_stop(false, false);
		return;
	}

	if (esp_ble_gap_register_callback(bt_gap_cb)) {
		ESP_LOGE(TION_LOG_TAG, "esp_ble_gap_register_callback failed");
		bt_stop(false, false);
		return;
	}

	if (esp_ble_gattc_register_callback(bt_gattc_cb)) {
		ESP_LOGE(TION_LOG_TAG, "P500, esp_ble_gattc_register_callback failed");
		bt_stop(false, false);
		return;
	}

	if (esp_ble_gattc_app_register(PROFILE_APP_ID)) {
		ESP_LOGE(TION_LOG_TAG, "P500, esp_ble_gattc_app_register failed");
		bt_stop(false, false);
		return;
	}
}

void bt_gap_cb(esp_gap_ble_cb_event_t event, esp_ble_gap_cb_param_t *param) {
	if (!tion_exec_command) {
		return;
	}

	/* If event is register event, store the gattc_if for each profile */
	switch (event) {
	case ESP_GAP_BLE_SCAN_PARAM_SET_COMPLETE_EVT: {
		esp_ble_gap_start_scanning(30);
	}
		break;

	case ESP_GAP_BLE_SCAN_RESULT_EVT: {
		esp_ble_gap_cb_param_t *scan_result = (esp_ble_gap_cb_param_t*) param;

		switch (scan_result->scan_rst.search_evt) {
		case ESP_GAP_SEARCH_INQ_RES_EVT: {
			uint8_t adv_name_len = 0;
			uint8_t *adv_name = esp_ble_resolve_adv_data(scan_result->scan_rst.ble_adv, ESP_BLE_AD_TYPE_NAME_CMPL, &adv_name_len);
			if (adv_name != NULL) {
				if (strlen(TION_DEVICE_NAME) == adv_name_len && strncmp((char*) adv_name, TION_DEVICE_NAME, adv_name_len) == 0) {
					ESP_LOGI(TION_LOG_TAG, "Tion device found! Trying to connect to it.");
					esp_ble_gap_stop_scanning();
					esp_ble_gattc_open(gl_profile_tab.gattc_if, scan_result->scan_rst.bda, scan_result->scan_rst.ble_addr_type, true);
				}
			}
		}
			break;

		default:
			break;
		}
	}
		break;

	default:
		break;
	}
}

static esp_err_t bt_init_handles(esp_gatt_if_t gattc_if, esp_ble_gattc_cb_param_t *p_data, uint16_t count) {
	esp_gattc_char_elem_t *char_elem_result = (esp_gattc_char_elem_t*) malloc(sizeof(esp_gattc_char_elem_t) * count);
	if (!char_elem_result) {
		bt_stop(true, true);
		ESP_LOGE(TION_LOG_TAG, "No memory for esp_ble_gattc_get_char_by_uuid");
		return ESP_FAIL;
	} else {
		if (esp_ble_gattc_get_char_by_uuid(
				gattc_if,
				p_data->search_cmpl.conn_id,
				gl_profile_tab.service_start_handle,
				gl_profile_tab.service_end_handle,
				tion_remote_characteristics_read_uuid,
				char_elem_result,
				&count)) {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "READ characteristics not found");
			return ESP_FAIL;
		} else {
			if (count > 0 && (char_elem_result[0].properties & ESP_GATT_CHAR_PROP_BIT_NOTIFY)) {
				gl_profile_tab.read_handle = char_elem_result[0].char_handle;
				esp_ble_gattc_register_for_notify(gattc_if, gl_profile_tab.remote_bda, char_elem_result[0].char_handle);
			}
		}

		if (esp_ble_gattc_get_char_by_uuid(
				gattc_if,
				p_data->search_cmpl.conn_id,
				gl_profile_tab.service_start_handle,
				gl_profile_tab.service_end_handle,
				tion_remote_characteristics_write_uuid,
				char_elem_result,
				&count)) {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "WRITE characteristics not found");
			return ESP_FAIL;
		} else {
			if (count > 0 && (char_elem_result[0].properties & ESP_GATT_CHAR_PROP_BIT_WRITE)) {
				gl_profile_tab.write_handle = char_elem_result[0].char_handle;
			}
		}

		if (esp_ble_gattc_get_char_by_uuid(
				gattc_if,
				p_data->search_cmpl.conn_id,
				gl_profile_tab.service_start_handle,
				gl_profile_tab.service_end_handle,
				tion_remote_service_uuid,
				char_elem_result,
				&count)) {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "WRITE characteristics not found");
			return ESP_FAIL;
		} else {
			if (count > 0 && (char_elem_result[0].properties & ESP_GATT_CHAR_PROP_BIT_WRITE)) {
				gl_profile_tab.pair_handle = char_elem_result[0].char_handle;
			}
		}

		free(char_elem_result);

		execute_tion_command();

		return ESP_OK;
	}
}

static void bt_gattc_cb(esp_gattc_cb_event_t event, esp_gatt_if_t gattc_if, esp_ble_gattc_cb_param_t *param) {
	if (!tion_exec_command) {
		return;
	}

	esp_ble_gattc_cb_param_t *p_data = (esp_ble_gattc_cb_param_t*) param;

	switch (event) {
	case ESP_GATTC_REG_EVT: {
		if (param->reg.status == ESP_GATT_OK) {
			gl_profile_tab.gattc_if = gattc_if;

			if (esp_ble_gap_set_scan_params(&ble_scan_params)) {
				bt_stop(true, true);
				ESP_LOGE(TION_LOG_TAG, "esp_ble_gap_set_scan_params failed");
			}
		} else {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "reg app failed");
		}
		break;
		gl_profile_tab.gattc_if = gattc_if;

	}
		break;

	case ESP_GATTC_CONNECT_EVT: {
		gl_profile_tab.conn_id = p_data->connect.conn_id;
		memcpy(gl_profile_tab.remote_bda, p_data->connect.remote_bda, sizeof(esp_bd_addr_t));
	}
		break;

	case ESP_GATTC_OPEN_EVT: {
		if (param->open.status != ESP_GATT_OK) {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "open connection failed, status %d", param->open.status);
		} else {
			ESP_LOGI(TION_LOG_TAG, "Successfully connected to TION");
		}
	}
		break;

	case ESP_GATTC_DIS_SRVC_CMPL_EVT: {
		if (param->dis_srvc_cmpl.status != ESP_GATT_OK) {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "discover service failed");
		} else {
			esp_ble_gattc_search_service(gattc_if, param->cfg_mtu.conn_id, &tion_remote_service_uuid);
		}
	}
		break;

	case ESP_GATTC_SEARCH_RES_EVT: {
		gl_profile_tab.service_start_handle = p_data->search_res.start_handle;
		gl_profile_tab.service_end_handle = p_data->search_res.end_handle;
	}
		break;

	case ESP_GATTC_SEARCH_CMPL_EVT: {
		if (p_data->search_cmpl.status != ESP_GATT_OK) {
			bt_stop(true, true);
			ESP_LOGE(TION_LOG_TAG, "search service failed");
		} else {
			uint16_t count = 0;
			if (esp_ble_gattc_get_attr_count(
					gattc_if,
					p_data->search_cmpl.conn_id,
					ESP_GATT_DB_CHARACTERISTIC,
					gl_profile_tab.service_start_handle,
					gl_profile_tab.service_end_handle,
					0,
					&count)) {
				bt_stop(true, true);
				ESP_LOGE(TION_LOG_TAG, "esp_ble_gattc_get_attr_count error");
			} else {
				if (count > 0) {
					if (bt_init_handles(gattc_if, p_data, count)) {
						bt_stop(true, true);
						ESP_LOGE(TION_LOG_TAG, "bt_init_handles error");
					} else {
						execute_tion_command();
					}
				} else {
					bt_stop(true, true);
					ESP_LOGE(TION_LOG_TAG, "esp_ble_gattc_get_attr_count :: Attributes count == 0 ???");
				}
			}
		}
	}
		break;

	case ESP_GATTC_WRITE_CHAR_EVT: {
        if (p_data->write.status != ESP_GATT_OK) {
			bt_stop(true, true);
            ESP_LOGE(TION_LOG_TAG, "write char failed, error status = %x", p_data->write.status);
            break;
        }

		execute_tion_command();

        break;
	}
	break;

	case ESP_GATTC_REG_FOR_NOTIFY_EVT: {
		if (p_data->read.status != ESP_GATT_OK) {
			bt_stop(true, true);
            ESP_LOGE(TION_LOG_TAG, "read char failed, error status = %x", p_data->write.status);
            break;
		}

		if (tion_exec_command->current_status != NULL) {
			free(tion_exec_command->current_status);
			tion_exec_command->current_status = NULL;
		}

		tion_exec_command->current_status = decode_tion_status(p_data->read.value, p_data->read.value_len);
		if (tion_exec_command->current_status == NULL) {
			bt_stop(true, true);
            ESP_LOGE(TION_LOG_TAG, "Cant decode tion status message. size = %d", p_data->read.value_len);
		} else {
			execute_tion_command();
		}
	}
	break;

	default:
		break;
	}
}

