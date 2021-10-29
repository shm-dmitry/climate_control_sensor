#ifndef MAIN_FAN_FAN_API_H_
#define MAIN_FAN_FAN_API_H_

#include "esp_err.h"
#include "stdbool.h"

typedef void (* fan_callback_t)(bool state);

esp_err_t fan_init(int gpio, fan_callback_t callback);

esp_err_t fan_start();

esp_err_t fan_stop();

#endif /* MAIN_FAN_FAN_API_H_ */
