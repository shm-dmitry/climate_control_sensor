#ifndef MAIN_GPIO_TOUCHPAD_TOUCHPAD_H_
#define MAIN_GPIO_TOUCHPAD_TOUCHPAD_H_

#include "driver/touch_sensor.h"

void touchpad_init(touch_pad_t pad, const char* status_topic);

#endif /* MAIN_GPIO_TOUCHPAD_TOUCHPAD_H_ */
