#include "sgp30_nvs.h"
#include "../../init/nvs_rw.h"
#include "../../log.h"

#define SGP30_NVS_NAME "sgp30_baseline"

esp_err_t sgp30_nvs_save_baseline(const sgp30_baseline_t * baseline) {
	if (baseline == NULL) {
		return nvs_write_buffer(SGP30_NVS_NAME, NULL, 0);
	}

	uint8_t buffer[4] = { baseline->co2 / 256, baseline->co2 % 256, baseline->tvoc / 256, baseline->tvoc % 256 };

	esp_err_t res = nvs_write_buffer(SGP30_NVS_NAME, buffer, 4);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant save info to NVS. Name = %s, res = %d", SGP30_NVS_NAME, res);
	}

	return res;
}

esp_err_t sgp30_nvs_read_baseline(sgp30_baseline_t * baseline) {
	uint8_t * buffer = NULL;
	size_t size = 0;

	esp_err_t res = nvs_read_buffer(SGP30_NVS_NAME, &buffer, &size);
	if (res) {
		ESP_LOGE(SGP30_LOG, "Cant read info to NVS. Name = %s, res = %d", SGP30_NVS_NAME, res);
		return res;
	}

	if (size == 4) {
		baseline->co2 = buffer[0] * 256 + buffer[1];
		baseline->tvoc = buffer[2] * 256 + buffer[3];
	} else {
		ESP_LOGE(SGP30_NVS_NAME, "Invalid buffer size in VNS: %d", size);
	}

	if (buffer != NULL) {
		free(buffer);
	}

	return ESP_OK;
}

