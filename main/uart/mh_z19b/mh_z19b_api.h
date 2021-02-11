#ifndef MAIN_MH_Z19B_MH_Z19B_API_H_
#define MAIN_MH_Z19B_MH_Z19B_API_H_

#include "mh_z19b_def.h"
#include "stdbool.h"
#include "../uart_config_def.h"

esp_err_t mh_z19b_init_driver(const uart_config_def_t * config, mh_z19b_range range);

esp_err_t mh_z19b_autocalibrate(bool value);
esp_err_t mh_z19b_calibrate(uint16_t co2);

esp_err_t mh_z19b_read(mh_z19b_data_t * data);

#endif /* MAIN_MH_Z19B_MH_Z19B_API_H_ */
