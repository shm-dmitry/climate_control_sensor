#ifndef MAIN_GPIO_IR_IR_API_H_
#define MAIN_GPIO_IR_IR_API_H_

#include "esp_err.h"

esp_err_t ir_transmit(uint8_t protocol, uint32_t address, uint32_t command);

esp_err_t ir_init(int gpio);

#endif /* MAIN_GPIO_IR_IR_API_H_ */
