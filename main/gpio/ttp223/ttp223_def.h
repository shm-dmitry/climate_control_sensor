#ifndef MAIN_GPIO_TTP223_TTP223_DEF_H_
#define MAIN_GPIO_TTP223_TTP223_DEF_H_

#include "stdint.h"

#define TTP223_ON_KEY_DOWN 0x00
#define TTP223_ON_KEY_UP   0x01

typedef void (* ttp223_callback_t)(uint8_t state);

#endif /* MAIN_GPIO_TTP223_TTP223_DEF_H_ */
