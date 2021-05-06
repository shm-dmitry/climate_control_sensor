#include "tion_bt.h"

#include "../log.h"

#include "tion_api.h"
#include "tion_bt_timeout_checker.h"

#include "esp_bt.h"
#include "esp_gatt_defs.h"
#include "esp_bt_main.h"
#include "esp_gatt_common_api.h"
#include "esp_gap_ble_api.h"

#include "freertos/task.h"

#include <unistd.h>
#include <string.h>
#include "time.h"
#include "tion_ble_def.h"
#include "tion_bt_command.h"

#define TION_RETRY_SLEEP 500 / portTICK_PERIOD_MS // 0.5 sec
#define PAIR_RETRY_ALLOWED 100
#define WRITE_RETRY_ALLOWED 3
#define GET_STATUS_RETRY_ALLOWED 3
#define TION_PAIR_TIMEOUT 10

static void tion_bt_gap_cb(esp_gap_ble_cb_event_t event, esp_ble_gap_cb_param_t *param);
static void tion_bt_gattc_cb(esp_gattc_cb_event_t event, esp_gatt_if_t gattc_if, esp_ble_gattc_cb_param_t *param);

static void tion_bt_start();
static void tion_bt_stop(bool);

static struct tion_bt_gattc_profile gl_profile_tab = {
		.gattc_if = ESP_GATT_IF_NONE, /* Not get the gatt_if, so initial is ESP_GATT_IF_NONE */

		.read_handle = ESP_GATT_ILLEGAL_HANDLE,
		.write_handle = ESP_GATT_ILLEGAL_HANDLE,
		.pair_handle = ESP_GATT_ILLEGAL_HANDLE
};

static struct tion_bt_exec_command_t* tion_exec_command = NULL;
static tion_status_callback_t tion_status_callback;
static uint8_t tion_uuid_generator = 0;

void tion_bt_register_status_callback(tion_status_callback_t callback) {
	tion_status_callback = callback;
}

bool tion_bt_prepare_exec_command(uint8_t retry_allowed_count) {
	if (tion_exec_command) {
		time_t started = tion_exec_command->started;

		time_t now;
		time(&now);

		if (now - started > TION_BT_EXEC_TIMEOUT) {
			tion_bt_stop(false);
		} else {
			return false;
		}
	}

	tion_exec_command_t * temp_tion_exec_command = (tion_exec_command_t *) malloc(sizeof(tion_exec_command_t));
	if (temp_tion_exec_command == NULL) {
		ESP_LOGE(TION_LOG, "tion_bt_prepare_exec_command: cant allocate memory");
		return false;
	}

	memset(temp_tion_exec_command, 0, sizeof(tion_exec_command_t));
	time(&temp_tion_exec_command->started);
	temp_tion_exec_command->retry_allowed_count = retry_allowed_count;
	temp_tion_exec_command->command_uuid = (tion_uuid_generator++);

	if (tion_exec_command) {
		free(tion_exec_command);
	}

	tion_exec_command = temp_tion_exec_command;

	return true;
}

bool tion_bt_check_can_send_command(tion_change_status_t * corrected) {
	bool has_current_status = tion_exec_command->current_status == NULL;

	// check check-sum
	if (tion_exec_command->new_status.check_sum != TION_CHANGE_STATUS_INVALID_CHECKSUM) {
		if (has_current_status) {
			if (tion_exec_command->new_status.check_sum != tion_exec_command->current_status->check_sum) {
				ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command checksum invalid: passed %d awaited %d", tion_exec_command->new_status.check_sum, tion_exec_command->current_status->check_sum);
				return false;
			} else {
				corrected->check_sum = tion_exec_command->new_status.check_sum;
			}
		} else {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant check checksum - no current status.");
			return false; // cant check check-sum, so exit
		}
	} else {
		if (has_current_status) {
			corrected->check_sum = tion_exec_command->current_status->check_sum;
		} else {
			corrected->check_sum = TION_CHANGE_STATUS_INVALID_CHECKSUM;
		}
	}

	// check other fields and setup default values if need
	if (tion_exec_command->new_status.fan_speed == TION_CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant setup default fan_speed - no current status.");
			return false;
		} else {
			corrected->fan_speed = tion_exec_command->current_status->fan_spped;
		}
	} else {
		corrected->fan_speed = tion_exec_command->new_status.fan_speed;
	}

	if (tion_exec_command->new_status.target_temperature == TION_CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant setup default target_temperature - no current status.");
			return false;
		} else {
			corrected->target_temperature = tion_exec_command->current_status->target_temperature;
		}
	} else {
		corrected->target_temperature = tion_exec_command->new_status.target_temperature;
	}

	if (tion_exec_command->new_status.mode == TION_CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant setup default mode - no current status.");
			return false;
		} else {
			corrected->mode = tion_exec_command->current_status->mode;
		}
	} else {
		corrected->mode = tion_exec_command->new_status.mode;
	}

	if (tion_exec_command->new_status.heater == TION_CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant setup default heater - no current status.");
			return false;
		} else {
			corrected->heater = tion_exec_command->current_status->heater ? TION_CHANGE_STATUS_TRUE : TION_CHANGE_STATUS_FALSE;
		}
	} else {
		corrected->heater = tion_exec_command->new_status.heater ? TION_CHANGE_STATUS_TRUE : TION_CHANGE_STATUS_FALSE;
	}

	if (tion_exec_command->new_status.state == TION_CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant setup default state - no current status.");
			return false;
		} else {
			corrected->state = tion_exec_command->current_status->state ? TION_CHANGE_STATUS_TRUE : TION_CHANGE_STATUS_FALSE;
		}
	} else {
		corrected->state = tion_exec_command->new_status.state ? TION_CHANGE_STATUS_TRUE : TION_CHANGE_STATUS_FALSE;
	}

	if (tion_exec_command->new_status.sound == TION_CHANGE_STATUS_NOT_SET) {
		if (has_current_status) {
			ESP_LOGW(TION_LOG, "tion_bt_check_can_send_command cant setup default sound - no current status.");
			return false;
		} else {
			corrected->sound = tion_exec_command->current_status->sound ? TION_CHANGE_STATUS_TRUE : TION_CHANGE_STATUS_FALSE;
		}
	} else {
		corrected->sound = tion_exec_command->new_status.sound ? TION_CHANGE_STATUS_TRUE : TION_CHANGE_STATUS_FALSE;
	}

	return true;
}

void tion_bt_execute_command() {
	if (tion_exec_command->current_command >= tion_exec_command->commands_size) {
		ESP_LOGI(TION_LOG, "tion_bt_execute_command: All comands processed.");
		tion_bt_stop(false);
		return;
	}

	esp_err_t result;
	uint8_t command = tion_exec_command->commands[tion_exec_command->current_command];
	switch (command) {
	case TION_BT_EXEC_COMMAND_PAIR:
		result = tion_api_send_pair_command(gl_profile_tab.gattc_if, gl_profile_tab.conn_id, gl_profile_tab.write_handle);
		tion_exec_command->current_command++;
		break;
	case TION_BT_EXEC_COMMAND_REQUEST_DATA:
		if (tion_exec_command->current_status != NULL) {
			free(tion_exec_command->current_status);
			tion_exec_command->current_status = NULL;
		}

		result = tion_api_send_request_data_command(gl_profile_tab.gattc_if, gl_profile_tab.conn_id, gl_profile_tab.write_handle);
		tion_exec_command->current_command++;
		break;
	case TION_BT_EXEC_COMMAND_WAIT_TION_STATUS:
		if (tion_exec_command->current_status != NULL) {
			tion_exec_command->current_command++;
		}
		result = ESP_OK;
		break;
	case TION_BT_EXEC_COMMAND_WRITE_DATA: {
		tion_change_status_t newstatus;
		memset(&newstatus, TION_CHANGE_STATUS_NOT_SET, sizeof(tion_change_status_t));

		if (tion_bt_check_can_send_command(&newstatus)) {
			result = tion_api_send_write_data_command(gl_profile_tab.gattc_if, gl_profile_tab.conn_id, gl_profile_tab.write_handle, newstatus);
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
		ESP_LOGE(TION_LOG, "tion_bt_execute_command Cant send command %d to TION. error_code %d", command, result);
		tion_bt_stop(true);
	}
}

void tion_bt_pair() {
	ESP_LOGI(TION_LOG, "PAIR command received!");

	if (!tion_bt_prepare_exec_command(PAIR_RETRY_ALLOWED)) {
		ESP_LOGE(TION_LOG, "Cant start PAIR command: allready working");
		return;
	}

	tion_exec_command->commands_size = 3;
	tion_exec_command->commands[0] = TION_BT_EXEC_COMMAND_PAIR;
	tion_exec_command->commands[1] = TION_BT_EXEC_COMMAND_REQUEST_DATA;
	tion_exec_command->commands[2] = TION_BT_EXEC_COMMAND_WAIT_TION_STATUS;

	tion_bt_start();
}

void tion_bt_write_new_status(tion_change_status_t status) {
	ESP_LOGI(TION_LOG, "WRITE-NEW-STATUS command received!");

	if (!tion_bt_prepare_exec_command(WRITE_RETRY_ALLOWED)) {
		ESP_LOGE(TION_LOG, "Cant start WRITE-NEW-STATUS command: allready working");
		return;
	}

	if (status.check_sum != 0) {
		tion_exec_command->commands_size = 5;
		tion_exec_command->commands[0] = TION_BT_EXEC_COMMAND_REQUEST_DATA;
		tion_exec_command->commands[1] = TION_BT_EXEC_COMMAND_WAIT_TION_STATUS;
		tion_exec_command->commands[2] = TION_BT_EXEC_COMMAND_WRITE_DATA;
		tion_exec_command->commands[3] = TION_BT_EXEC_COMMAND_REQUEST_DATA;
		tion_exec_command->commands[4] = TION_BT_EXEC_COMMAND_WAIT_TION_STATUS;
	} else {
		tion_exec_command->commands_size = 3;
		tion_exec_command->commands[0] = TION_BT_EXEC_COMMAND_WRITE_DATA;
		tion_exec_command->commands[1] = TION_BT_EXEC_COMMAND_REQUEST_DATA;
		tion_exec_command->commands[2] = TION_BT_EXEC_COMMAND_WAIT_TION_STATUS;
	}

	tion_bt_start();
}

void tion_bt_request_status() {
	ESP_LOGI(TION_LOG, "REQUEST-STATUS command received!");

	if (!tion_bt_prepare_exec_command(GET_STATUS_RETRY_ALLOWED)) {
		ESP_LOGE(TION_LOG, "Cant start REQUEST-STATUS command: allready working");
		return;
	}

	tion_exec_command->commands_size = 2;
	tion_exec_command->commands[0] = TION_BT_EXEC_COMMAND_REQUEST_DATA;
	tion_exec_command->commands[1] = TION_BT_EXEC_COMMAND_WAIT_TION_STATUS;

	tion_bt_start();
}

void tion_bt_stop(bool allow_retry) {
	if (!tion_exec_command) {
		return;
	}

	tion_bt_timeout_check_stop();

	if (tion_exec_command->current_status != NULL) {
		if (tion_status_callback != NULL) {
			tion_status_callback(tion_exec_command->current_status);
		}

		free(tion_exec_command->current_status);
		tion_exec_command->current_status = NULL;
	}

	if (allow_retry && tion_exec_command->retry_allowed_count > 0) {
		tion_exec_command->retry_allowed_count--;
	} else {
		free(tion_exec_command);
		tion_exec_command = NULL;
	}

	if (gl_profile_tab.gattc_if != ESP_GATT_IF_NONE) {
		esp_ble_gattc_close(gl_profile_tab.gattc_if, gl_profile_tab.conn_id);
	}

	esp_ble_gattc_app_unregister(gl_profile_tab.gattc_if);

	gl_profile_tab.gattc_if = ESP_GATT_IF_NONE;
	gl_profile_tab.read_handle = ESP_GATT_ILLEGAL_HANDLE;
	gl_profile_tab.write_handle = ESP_GATT_ILLEGAL_HANDLE;
	gl_profile_tab.pair_handle = ESP_GATT_ILLEGAL_HANDLE;

	ESP_LOGI(TION_LOG, "BT Stopped");

	if (tion_exec_command) {
		uint8_t uid = tion_exec_command->command_uuid;

		vTaskDelay(TION_RETRY_SLEEP);

		if (tion_exec_command && uid == tion_exec_command->command_uuid) {
			ESP_LOGI(TION_LOG, "Re-starting current task. Retries left: %d", tion_exec_command->retry_allowed_count);

			tion_bt_start();
		} else {
			ESP_LOGW(TION_LOG, "tion_bt_stop UID Mistmatch ( %d != %d ). Cant restart command. Command changed during await?", uid, (tion_exec_command == NULL ? -1 : (int16_t) tion_exec_command->command_uuid));
		}
	}
}

esp_err_t tion_bt_init() {
	esp_bt_controller_config_t bt_cfg = BT_CONTROLLER_INIT_CONFIG_DEFAULT();

	esp_err_t res = esp_bt_controller_init(&bt_cfg);
	if (res) {
		ESP_LOGE(TION_LOG, "esp_bt_controller_init failed");
		return res;
	}


	res = esp_bt_controller_enable(ESP_BT_MODE_BLE);
	if (res) {
		ESP_LOGE(TION_LOG, "esp_bt_controller_enable failed");
		return res;
	}

	res = esp_bluedroid_init();
	if (res) {
		ESP_LOGE(TION_LOG, "esp_bluedroid_init failed");
		return res;
	}

	res = esp_bluedroid_enable();
	if (res) {
		ESP_LOGE(TION_LOG, "esp_bluedroid_enable failed");
		return res;
	}

	tion_bt_timeout_check_init(tion_bt_stop, &tion_exec_command);

	ESP_LOGI(TION_LOG, "Tion driver initialized.");

	return ESP_OK;
}

void tion_bt_start() {
	if (!tion_exec_command) {
		ESP_LOGE(TION_LOG, "tion_bt_start error: no command");
		return;
	}

	ESP_LOGI(TION_LOG, "Starting BT...");

	if (esp_ble_gap_register_callback(tion_bt_gap_cb)) {
		ESP_LOGE(TION_LOG, "esp_ble_gap_register_callback failed");
		tion_bt_stop(false);
		return;
	}

	if (esp_ble_gattc_register_callback(tion_bt_gattc_cb)) {
		ESP_LOGE(TION_LOG, "esp_ble_gattc_register_callback failed");
		tion_bt_stop(false);
		return;
	}

	if (esp_ble_gattc_app_register(TION_BT_PROFILE_APP_ID)) {
		ESP_LOGE(TION_LOG, "esp_ble_gattc_app_register failed");
		tion_bt_stop(false);
		return;
	}

	ESP_LOGI(TION_LOG, "BT started");
}

void tion_bt_gap_cb(esp_gap_ble_cb_event_t event, esp_ble_gap_cb_param_t *param) {
	if (!tion_exec_command) {
		return;
	}

	ESP_LOGI(TION_LOG, "BT Callback bt_gap_cb received. Event %d", event);

	/* If event is register event, store the gattc_if for each profile */
	switch (event) {
	case ESP_GAP_BLE_SET_LOCAL_PRIVACY_COMPLETE_EVT: {
        if (param->local_privacy_cmpl.status != ESP_BT_STATUS_SUCCESS){
            ESP_LOGE(TION_LOG, "tion_bt_gap_cb config local privacy failed, error code =%x", param->local_privacy_cmpl.status);
        } else {
			if (esp_ble_gap_set_scan_params(&tion_bt_ble_scan_params)) {
				ESP_LOGE(TION_LOG, "tion_bt_gap_cb: esp_ble_gap_set_scan_params failed");
				tion_bt_stop(true);
			}
        }
	}
    break;

	case ESP_GAP_BLE_SCAN_PARAM_SET_COMPLETE_EVT: {
		esp_ble_gap_start_scanning(TION_PAIR_TIMEOUT);
		tion_bt_timeout_check_start(TION_PAIR_TIMEOUT + 5);
	}
		break;

	case ESP_GAP_BLE_SCAN_RESULT_EVT: {
		esp_ble_gap_cb_param_t *scan_result = (esp_ble_gap_cb_param_t*) param;

		switch (scan_result->scan_rst.search_evt) {
		case ESP_GAP_SEARCH_INQ_RES_EVT: {
			uint8_t adv_name_len = 0;
			uint8_t *adv_name = esp_ble_resolve_adv_data(scan_result->scan_rst.ble_adv, ESP_BLE_AD_TYPE_NAME_CMPL, &adv_name_len);
			if (adv_name == NULL) {
				adv_name = esp_ble_resolve_adv_data(scan_result->scan_rst.ble_adv, ESP_BLE_AD_TYPE_NAME_SHORT, &adv_name_len);
			}

			if (adv_name != NULL) {
				if (strlen(TION_BT_DEVICE_NAME) == adv_name_len && strncmp((char*) adv_name, TION_BT_DEVICE_NAME, adv_name_len) == 0) {
					ESP_LOGI(TION_LOG, "Tion device found! Trying to connect to it.");

					tion_bt_timeout_check_stop();
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

static esp_err_t tion_bt_init_handles(esp_gatt_if_t gattc_if, esp_ble_gattc_cb_param_t *p_data, uint16_t count) {
	esp_gattc_char_elem_t *char_elem_result = (esp_gattc_char_elem_t*) malloc(sizeof(esp_gattc_char_elem_t) * count);
	if (!char_elem_result) {
		ESP_LOGE(TION_LOG, "tion_bt_init_handles: No memory for esp_ble_gattc_get_char_by_uuid");
		tion_bt_stop(true);
		return ESP_FAIL;
	} else {
		if (esp_ble_gattc_get_char_by_uuid(
				gattc_if,
				p_data->search_cmpl.conn_id,
				gl_profile_tab.service_start_handle,
				gl_profile_tab.service_end_handle,
				tion_bt_remote_characteristics_read_uuid,
				char_elem_result,
				&count)) {
			ESP_LOGE(TION_LOG, "tion_bt_init_handles: READ characteristics not found");
			tion_bt_stop(true);
			return ESP_FAIL;
		} else {
			if (count > 0 && (char_elem_result[0].properties & ESP_GATT_CHAR_PROP_BIT_NOTIFY)) {
				gl_profile_tab.read_handle = char_elem_result[0].char_handle;
				esp_ble_gattc_register_for_notify(gattc_if, gl_profile_tab.remote_bda, char_elem_result[0].char_handle);

				ESP_LOGI(TION_LOG, "tion_bt_init_handles: read_handle == %04x", gl_profile_tab.read_handle);
			}
		}

		if (esp_ble_gattc_get_char_by_uuid(
				gattc_if,
				p_data->search_cmpl.conn_id,
				gl_profile_tab.service_start_handle,
				gl_profile_tab.service_end_handle,
				tion_bt_remote_characteristics_write_uuid,
				char_elem_result,
				&count)) {
			ESP_LOGE(TION_LOG, "tion_bt_init_handles: WRITE characteristics not found");
			tion_bt_stop(true);
			return ESP_FAIL;
		} else {
			if (count > 0 && (char_elem_result[0].properties & ESP_GATT_CHAR_PROP_BIT_WRITE)) {
				gl_profile_tab.write_handle = char_elem_result[0].char_handle;

				ESP_LOGI(TION_LOG, "tion_bt_init_handles: write_handle == %04x", gl_profile_tab.write_handle);
			}
		}

		esp_gattc_service_elem_t * service = malloc(sizeof(esp_gattc_service_elem_t));
		uint16_t service_count = 1;
		if (esp_ble_gattc_get_service(gattc_if,
				p_data->search_cmpl.conn_id,
				&tion_bt_remote_service_uuid,
				service,
				&service_count,
				0)) {
			ESP_LOGE(TION_LOG, "tion_bt_init_handles: SERVICE not found");
			tion_bt_stop(true);
			return ESP_FAIL;
		}

		if (esp_ble_gattc_get_all_char(
				gattc_if,
				p_data->search_cmpl.conn_id,
				service->start_handle,
				service->end_handle,
				char_elem_result,
				&count,
				0)) {
			ESP_LOGE(TION_LOG, "tion_bt_init_handles: SERVICE characteristics not found");
			tion_bt_stop(true);
			return ESP_FAIL;
		} else {
			if (count > 0 && (char_elem_result[0].properties & ESP_GATT_CHAR_PROP_BIT_WRITE)) {
				gl_profile_tab.pair_handle = char_elem_result[0].char_handle;

				ESP_LOGI(TION_LOG, "tion_bt_init_handles: pair_handle == %04x", gl_profile_tab.pair_handle);
			}
		}

		free(service);
		free(char_elem_result);

		tion_bt_execute_command();

		return ESP_OK;
	}
}

static void tion_bt_gattc_cb(esp_gattc_cb_event_t event, esp_gatt_if_t gattc_if, esp_ble_gattc_cb_param_t *param) {
	if (!tion_exec_command) {
		return;
	}

	ESP_LOGI(TION_LOG, "BT Callback tion_bt_gattc_cb received. Event %d", event);

	esp_ble_gattc_cb_param_t *p_data = (esp_ble_gattc_cb_param_t*) param;

	switch (event) {
	case ESP_GATTC_REG_EVT: {
		if (param->reg.status == ESP_GATT_OK) {
			gl_profile_tab.gattc_if = gattc_if;

			esp_ble_gap_config_local_privacy(true);
		} else {
			ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: reg app failed");
			tion_bt_stop(true);
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
			ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: open connection failed, status %02x", param->open.status);
			tion_bt_stop(true);
		} else {
			ESP_LOGI(TION_LOG, "tion_bt_gattc_cb: Successfully connected to TION");
		}
	}
		break;

	case ESP_GATTC_DIS_SRVC_CMPL_EVT: {
		if (param->dis_srvc_cmpl.status != ESP_GATT_OK) {
			ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: discover service failed");
			tion_bt_stop(true);
		} else {
			esp_ble_gattc_search_service(gattc_if, param->cfg_mtu.conn_id, &tion_bt_remote_service_uuid);
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
			ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: search service failed");
			tion_bt_stop(true);
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
				ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: esp_ble_gattc_get_attr_count error");
				tion_bt_stop(true);
			} else {
				if (count > 0) {
					if (tion_bt_init_handles(gattc_if, p_data, count)) {
						ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: bt_init_handles error");
						tion_bt_stop(true);
					} else {
						tion_bt_execute_command();
					}
				} else {
					ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: esp_ble_gattc_get_attr_count :: Attributes count == 0 ???");
					tion_bt_stop(true);
				}
			}
		}
	}
		break;

	case ESP_GATTC_WRITE_CHAR_EVT: {
        if (p_data->write.status != ESP_GATT_OK) {
            ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: write char failed, error status = %x", p_data->write.status);
			tion_bt_stop(true);
            break;
        }

		tion_bt_execute_command();

        break;
	}
	break;

	case ESP_GATTC_REG_FOR_NOTIFY_EVT: {
		if (p_data->read.status != ESP_GATT_OK) {
            ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: read char failed, error status = %x", p_data->write.status);
			tion_bt_stop(true);
            break;
		}

		if (tion_exec_command ->commands[tion_exec_command->current_command] == TION_BT_EXEC_COMMAND_WAIT_TION_STATUS) {
			if (tion_exec_command->current_status != NULL) {
				free(tion_exec_command->current_status);
				tion_exec_command->current_status = NULL;
			}

			tion_exec_command->current_status = tion_api_decode_status(p_data->read.value, p_data->read.value_len);
			if (tion_exec_command->current_status == NULL) {
				ESP_LOGE(TION_LOG, "tion_bt_gattc_cb: Cant decode tion status message. size = %d", p_data->read.value_len);
				//tion_bt_stop(true);
			} else {
				tion_bt_execute_command();
			}
		}
	}
	break;

	default:
		break;
	}
}

