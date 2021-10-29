#ifndef MAIN_GPIO_TOUCHPAD_TOUCHPAD_DEF_H_
#define MAIN_GPIO_TOUCHPAD_TOUCHPAD_DEF_H_

#include "stdint.h"

#define TOUCHPAD_IDLE        			0x00
#define TOUCHPAD_ON_KEY_DOWN 			0x01
#define TOUCHPAD_ON_KEY_UP   			0x02
#define TOUCHPAD_ON_CLICK   			0x03
#define TOUCHPAD_ON_ERROR   			0xFF

typedef void (* touchpad_callback_t)(uint8_t state, uint8_t click_index);

#endif /* MAIN_GPIO_TOUCHPAD_TOUCHPAD_DEF_H_ */
