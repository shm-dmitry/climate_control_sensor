# Edit following two lines to set component requirements (see docs)
set(COMPONENT_REQUIRES )
set(COMPONENT_PRIV_REQUIRES )

set(COMPONENT_SRCS "main.c tion/tion.c tion/tion_api.c tion/tion_bt.c init/init.c init/wifi.c init/mqtt.c init/nvs_rw.c cjson/cJSON.c cjson/cjson_helper.c i2c/i2c_impl.c i2c/bme280/bme280_api.c i2c/bme280/bme280.c i2c/sgp30/sgp30_api.c i2c/sgp30/sgp30.c i2c/bh1750/bh1750_api.c i2c/bh1750/bh1750.c uart/mh_z19b/mh_z19b_api.c uart/mh_z19b/mh_z19b.c uart/pms7003/pms7003.c uart/pms7003/pms7003_api.c gpio/rgbled/rgbled.c gpio/rgbled/rgbled_api.c gpio/fan/fan.c gpio/fan/fan_api.c gpio/ttp223/ttp223_api.c gpio/ttp223/ttp223.c gpio/anemometer/anemometer_api.c  gpio/anemometer/anemometer.c gpio/anemometer/anemometer_nvs.c gpio/touchpad/touchpad.h gpio/touchpad/touchpad.c gpio/touchpad/touchpad_api.h gpio/touchpad/touchpad_api.c gpio/touchpad/touchpad_def.h")
set(COMPONENT_ADD_INCLUDEDIRS "")

register_component()
