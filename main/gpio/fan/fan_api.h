#ifndef MAIN_FAN_FAN_API_H_
#define MAIN_FAN_FAN_API_H_

#include "esp_err.h"

esp_err_t fan_init(int gpio);

esp_err_t fan_start();

esp_err_t fan_stop();

#endif /* MAIN_FAN_FAN_API_H_ */
