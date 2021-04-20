#ifndef MAIN_TION_TION_API_H_
#define MAIN_TION_TION_API_H_

#include <stdint.h>
#include "esp_err.h"
#include "tion_data.h"

esp_err_t tion_api_send_pair_command(uint16_t gattc_if, uint16_t conn_id, uint16_t pair_handle);

esp_err_t tion_api_send_request_data_command(uint16_t gattc_if, uint16_t conn_id, uint16_t write_handle);

esp_err_t tion_api_send_write_data_command(uint16_t gattc_if, uint16_t conn_id, uint16_t write_handle, tion_change_status_t status);

tion_status_t * tion_api_decode_status(uint8_t* buffer, uint16_t buffer_size);

#endif /* MAIN_TION_TION_API_H_ */
