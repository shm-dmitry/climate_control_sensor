#include "anemometer_nvs.h"

#include "../../init/nvs_rw.h"
#include "string.h"

#include "../../log.h"

#define ANEMOMETER_NVS_SETTINGS_NAME "anemometer_calibration_data"

void anemometer_nvs_save_settings(anemometer_calibration_table_t* table) {
	if (table == NULL || table->rows == NULL || table->rows_count == 0) {
		nvs_write_buffer(ANEMOMETER_NVS_SETTINGS_NAME, NULL, 0);
		ESP_LOGI(ANEMOMETER_LOG, "Calibration data reseted in NVS");
		return;
	}

	size_t buffer_size = sizeof(uint8_t) + sizeof(float) + sizeof(anemometer_calibration_table_row_t) * table->rows_count;
	uint8_t * buffer = (uint8_t* )malloc(buffer_size);
	memset(buffer, 0, 1 + sizeof(float) + sizeof(anemometer_calibration_table_row_t) * table->rows_count);

	buffer[0] = table->rows_count;
	memcpy(buffer + 1, &table->cross_sectional_area, sizeof(float));
	memcpy(buffer + 1 + sizeof(float), table->rows, sizeof(anemometer_calibration_table_row_t) * table->rows_count);

	nvs_write_buffer(ANEMOMETER_NVS_SETTINGS_NAME, buffer, buffer_size);

	ESP_LOGI(ANEMOMETER_LOG, "Calibration data saved in NVS: cross_sectional_area == %f, table rowcount == %d", table->cross_sectional_area, table->rows_count);

	free(buffer);
}

anemometer_calibration_table_t* anemometer_nvs_restore_settings() {
	uint8_t * buffer = NULL;
	size_t buffer_size = 0;

	if (nvs_read_buffer(ANEMOMETER_NVS_SETTINGS_NAME, &buffer, &buffer_size)) {
		ESP_LOGI(ANEMOMETER_LOG, "Cant read calibration data from VNS");
		return NULL;
	}

	if (buffer == NULL) {
		return NULL;
	}

	if (buffer_size < 1 + sizeof(float)) {
		ESP_LOGE(ANEMOMETER_LOG, "Invalid calibration data in NVS. Bad size %d", buffer_size);

		free(buffer);
		return NULL;
	}

	anemometer_calibration_table_t* result = (anemometer_calibration_table_t*) malloc(sizeof(anemometer_calibration_table_t));
	if (result == NULL) {
		ESP_LOGE(ANEMOMETER_LOG, "Cant allocate memory for calibration table. OOM.");

		free(buffer);
		return NULL;
	}

	result->rows_count = buffer[0];
	memcpy(&result->cross_sectional_area, buffer + 1, sizeof(float));

	if (result->rows_count == 0 ||
		result->rows_count > ANEMOMETER_CALIBRATION_MAXROWS ||
		buffer_size != 1 + sizeof(float) + sizeof(anemometer_calibration_table_row_t) * result->rows_count
	) {
		ESP_LOGE(ANEMOMETER_LOG, "Invalid calibration data in NVS. Invalid row_count: %d, buffer_size %d", result->rows_count, buffer_size);

		free(buffer);
		free(result);
		return NULL;
	}

	result->rows = (anemometer_calibration_table_row_t *) malloc(sizeof(anemometer_calibration_table_row_t) * result->rows_count);
	if (result->rows == NULL) {
		ESP_LOGE(ANEMOMETER_LOG, "Cant allocate memory for calibration table rows. OOM. rowcount = %d", result->rows_count);

		free(buffer);
		free(result);
		return NULL;
	}

	memcpy(result->rows, buffer + 1 + sizeof(float), sizeof(anemometer_calibration_table_row_t) * result->rows_count);

	free(buffer);

	ESP_LOGI(ANEMOMETER_LOG, "Calibration data loaded from NVS: cross_sectional_area == %f, table rowcount == %d", result->cross_sectional_area, result->rows_count);

	return result;
}
