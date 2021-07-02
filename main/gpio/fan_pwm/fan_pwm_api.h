#ifndef MAIN_GPIO_FAN_PWM_FAN_PWM_API_H_
#define MAIN_GPIO_FAN_PWM_FAN_PWM_API_H_

#include "esp_err.h"

esp_err_t fan_pwm_init(int gpio);

esp_err_t fan_pwm_set_percent(uint8_t percent);

#endif /* MAIN_GPIO_FAN_PWM_FAN_PWM_API_H_ */
