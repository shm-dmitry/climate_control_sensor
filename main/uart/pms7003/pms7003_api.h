#ifndef MAIN_UART_PMS7003_PMS7003_API_H_
#define MAIN_UART_PMS7003_PMS7003_API_H_

#include "esp_err.h"
#include "../uart_config_def.h"
#include "pms7003_def.h"

esp_err_t pms7003_init_driver(const uart_config_def_t * config);

esp_err_t pms7003_sleep();
esp_err_t pms7003_wakeup();
esp_err_t pms7003_set_active(bool is_active);

esp_err_t pms7003_read(pms7003_data_t * data);

#endif /* MAIN_UART_PMS7003_PMS7003_API_H_ */
