#include "nvs_rw.h"

#include "nvs_flash.h"
#include "esp_system.h"
#include "nvs.h"

#define STORAGE_NAMESPACE "climate_control"

esp_err_t nvs_read_buffer(const char* name, uint8_t** buffer, size_t * buffer_size) {
	nvs_handle_t handle;
	esp_err_t err;

    err = nvs_open(STORAGE_NAMESPACE, NVS_READONLY, &handle);
    if (err != ESP_OK) {
    	return err;
    }

    *buffer_size = 0;

    err = nvs_get_blob(handle, name, NULL, buffer_size);
    if (err != ESP_OK || *buffer_size == 0) {
    	nvs_close(handle);
    	return err;
    }

    *buffer = (uint8_t *) malloc(*buffer_size);
    if (*buffer == NULL) {
    	nvs_close(handle);
    	return ESP_FAIL;
    }

    err = nvs_get_blob(handle, name, *buffer, buffer_size);
    if (err != ESP_OK) {
    	nvs_close(handle);
    	return err;
    }

	nvs_close(handle);
	return ESP_OK;
}

esp_err_t nvs_write_buffer(const char* name, const uint8_t* buffer, size_t buffer_size) {
	nvs_handle_t handle;
	esp_err_t err;

    err = nvs_open(STORAGE_NAMESPACE, NVS_READWRITE, &handle);
    if (err != ESP_OK) {
    	return err;
    }

    err = nvs_erase_key(handle, name);
    if (err != ESP_OK && err != ESP_ERR_NVS_NOT_FOUND) {
    	nvs_close(handle);
    	return err;
    }

    err = nvs_commit(handle);
    if (err) {
    	nvs_close(handle);
    	return err;
    }

    if (buffer == NULL || buffer_size == 0) {
    	nvs_close(handle);
    	return ESP_OK;
    }

    err = nvs_set_blob(handle, name, buffer, buffer_size);
    if (err != ESP_OK) {
    	nvs_close(handle);
    	return err;
    }


    err = nvs_commit(handle);
    if (err) {
    	nvs_close(handle);
    	return err;
    }

	nvs_close(handle);
	return ESP_OK;
}
