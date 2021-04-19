#ifndef MAIN_TION_H_
#define MAIN_TION_H_

#include "tion_data.h"
#include "esp_err.h"

// based on:
// 1. TION API [unofficial] Python impl https://github.com/TionAPI/tion_python
// 2. ESP BLE example https://github.com/espressif/esp-idf/blob/6e77694/examples/bluetooth/bluedroid/ble/gatt_client/tutorial/Gatt_Client_Example_Walkthrough.md
// 3. https://habr.com/ru/post/457670/

typedef void (* tion_status_callback_t)(tion_status_t * current_status);

void tion_register_status_callback(tion_status_callback_t callback);

void tion_pair();

void tion_write_new_status(tion_change_status_t status);

void tion_request_status();

esp_err_t tion_bt_init();

#endif /* MAIN_TION_H_ */
