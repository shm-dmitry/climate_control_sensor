#ifndef MAIN_GPIO_ANEMOMETER_ANEMOMETER_API_H_
#define MAIN_GPIO_ANEMOMETER_ANEMOMETER_API_H_

#include "anemometer_def.h"
#include "esp_err.h"

esp_err_t anemometer_init(int gpio_A, int gpio_B, anemometer_callback_t callback);

void anemometer_calibrate(anemometer_calibration_table_t * table);

#endif /* MAIN_GPIO_ANEMOMETER_ANEMOMETER_API_H_ */
