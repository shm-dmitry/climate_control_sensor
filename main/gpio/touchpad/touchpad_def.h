#ifndef MAIN_GPIO_TOUCHPAD_TOUCHPAD_DEF_H_
#define MAIN_GPIO_TOUCHPAD_TOUCHPAD_DEF_H_

#include "stdint.h"

#define TOUCHPAD_ON_KEY_DOWN 0x00
#define TOUCHPAD_ON_KEY_UP   0x01

typedef void (* touchpad_callback_t)(uint8_t state);

#endif /* MAIN_GPIO_TOUCHPAD_TOUCHPAD_DEF_H_ */
