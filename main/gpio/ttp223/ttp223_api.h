#ifndef MAIN_GPIO_TTP223_TTP223_API_H_
#define MAIN_GPIO_TTP223_TTP223_API_H_

#include "ttp223_def.h"
#include "esp_err.h"

esp_err_t ttp223_init(uint8_t gpio, ttp223_callback_t callback);

#endif /* MAIN_GPIO_TTP223_TTP223_API_H_ */
