#ifndef MAIN_I2C_SGP30_SGP30_NVS_H_
#define MAIN_I2C_SGP30_SGP30_NVS_H_

#include "sgp30_def.h"
#include "esp_err.h"

esp_err_t sgp30_nvs_save_baseline(const sgp30_baseline_t * baseline);

esp_err_t sgp30_nvs_read_baseline(sgp30_baseline_t * baseline);


#endif /* MAIN_I2C_SGP30_SGP30_NVS_H_ */
