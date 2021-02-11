#include "bh1750_api.h"

#define BH1750_ADDRESS 0x23
#define BH1750_DEFAULT_MTREG 69
#define BH1750_HIGH_RES_MODE 0x10
#define BH1750_CONV_FACTOR 1.2

esp_err_t bh1750_configure(i2c_handler_t * i2c) {
	uint8_t buff = 0x10;
	esp_err_t res = i2c->write(BH1750_ADDRESS, &buff, 1); // hi-res
	if (res) {
		return res;
	}

	buff = (0b01000 << 3) | (BH1750_DEFAULT_MTREG >> 5);
	res = i2c->write(BH1750_ADDRESS, &buff, 1);
	if (res) {
		return res;
	}

	buff = (0b011 << 5) | (BH1750_DEFAULT_MTREG & 0b11111);
	res = i2c->write(BH1750_ADDRESS, &buff, 1);
	if (res) {
		return res;
	}

	buff = BH1750_HIGH_RES_MODE;
	return i2c->write(BH1750_ADDRESS, &buff, 1);
}

esp_err_t bh1750_read(i2c_handler_t * i2c, float * result) {
	uint8_t buffer[2] = { 0 };
	esp_err_t res = i2c->read(BH1750_ADDRESS, buffer, 2);
	if (res) {
		return res;
	}

	uint16_t level = buffer[0] << 8 | buffer[1];

	// TODO: if you want to change BH1750_DEFAULT_MTREG - see convertion code at https://github.com/claws/BH1750/blob/master/src/BH1750.cpp , readLightLevel method.

	*result = level / BH1750_CONV_FACTOR;
	return ESP_OK;
}
