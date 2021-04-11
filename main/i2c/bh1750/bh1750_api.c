#include "bh1750_api.h"

#include "../../log.h"

#define BH1750_I2C_ADDRESS 0x23

esp_err_t bh1750_configure(i2c_handler_t * i2c) {
	uint8_t buff = 0b00000001;
	// commandL power up!
	esp_err_t res = i2c->write(BH1750_I2C_ADDRESS, &buff, 1);
	if (res) {
		ESP_LOGE(BH1750_LOG, "Cant init driver [step wake_up]: %d", res);
		return res;
	}

	vTaskDelay(200 / portTICK_PERIOD_MS);

	// command: reset
	buff = 0b00000111;
	res = i2c->write(BH1750_I2C_ADDRESS, &buff, 1);
	if (res) {
		ESP_LOGE(BH1750_LOG, "Cant init driver [step reset sensor]: %d", res);
		return res;
	}

	// command: set hi-res-2 mode
	buff = 0b00010001;
	res = i2c->write(BH1750_I2C_ADDRESS, &buff, 1);
	if (res) {
		ESP_LOGE(BH1750_LOG, "Cant init driver [step set hires2 mode]: %d", res);
		return res;
	}

	// setup measurement time 120msec

	buff = 0b01000011;
	res = i2c->write(BH1750_I2C_ADDRESS, &buff, 1);
	if (res) {
		ESP_LOGE(BH1750_LOG, "Cant init driver [step set mtime hi-bits]: %d", res);
		return res;
	}

	buff = 0b01111000;
	res = i2c->write(BH1750_I2C_ADDRESS, &buff, 1);
	if (res) {
		ESP_LOGE(BH1750_LOG, "Cant init driver [step set mtime low-bits]: %d", res);
		return res;
	}

	return ESP_OK;
}

esp_err_t bh1750_read(i2c_handler_t * i2c, uint16_t * result) {
	uint8_t buffer[2] = { 0 };
	esp_err_t res = i2c->read(BH1750_I2C_ADDRESS, buffer, 2);
	if (res) {
		ESP_LOGE(BH1750_LOG, "Cant read info from sensor: %d", res);
		return res;
	}

	uint16_t level = buffer[0] << 8 | buffer[1];

	// TODO: if you want to change mode or mtreg - see convertion code at https://github.com/claws/BH1750/blob/master/src/BH1750.cpp , readLightLevel method.

	*result = level / 4;

	return ESP_OK;
}
