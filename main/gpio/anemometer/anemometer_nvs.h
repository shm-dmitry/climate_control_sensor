#ifndef MAIN_GPIO_ANEMOMETER_ANEMOMETER_NVS_H_
#define MAIN_GPIO_ANEMOMETER_ANEMOMETER_NVS_H_

#include "anemometer_def.h"

void anemometer_nvs_save_settings(anemometer_calibration_table_t* table);
anemometer_calibration_table_t* anemometer_nvs_restore_settings();

#endif /* MAIN_GPIO_ANEMOMETER_ANEMOMETER_NVS_H_ */
