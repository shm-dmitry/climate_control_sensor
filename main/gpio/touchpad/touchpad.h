#ifndef MAIN_GPIO_TOUCHPAD_TOUCHPAD_H_
#define MAIN_GPIO_TOUCHPAD_TOUCHPAD_H_

#include "esp_err.h"
#include "driver/touch_sensor.h"

esp_err_t touchpad_init(touch_pad_t pad, const char* status_topic);

#endif /* MAIN_GPIO_TOUCHPAD_TOUCHPAD_H_ */
