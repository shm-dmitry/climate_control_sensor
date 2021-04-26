#include "log.h"

#include "unistd.h"

#include "tion/tion.h"
#include "init/init.h"
#include "init/mqtt.h"
#include "i2c/bme280/bme280.h"
#include "i2c/sgp30/sgp30.h"
#include "i2c/bh1750/bh1750.h"
#include "i2c/i2c_impl.h"
#include "uart/mh_z19b/mh_z19b.h"
#include "uart/pms7003/pms7003.h"
#include "gpio/rgbled/rgbled.h"
#include "gpio/fan/fan.h"
#include "gpio/anemometer/anemometer.h"
#include "gpio/touchpad/touchpad.h"
#include "gpio/ir/ir.h"

void app_main(void)
{
	init_flash();
	init_wifi(CONFIG_WIFI_SSID, CONFIG_WIFI_PASSWORD, CONFIG_WIFI_TOPIC);
	init_snmp();

#if CONFIG_I2C_PORT_0_ENABLED
	i2c_register_port(I2C_NUM_0, CONFIG_I2C_PORT_0_GPIO_SDA, CONFIG_I2C_PORT_0_GPIO_SCL);
#endif
#if CONFIG_I2C_PORT_1_ENABLED
	i2c_register_port(I2C_NUM_1, CONFIG_I2C_PORT_1_GPIO_SDA, CONFIG_I2C_PORT_1_GPIO_SCL);
#endif


#if CONFIG_TION_ENABLED
	tion_startup(CONFIG_TION_MQTT_TOPIC_STATUS, CONFIG_TION_MQTT_TOPIC_COMMANDS);
#endif

#if CONFIG_BME280_ENABLED
	bme280_init(CONFIG_BME280_PORT, CONFIG_BME280_TOPIC_STATUS);
#endif

#if CONFIG_SGP30_ENABLED
	sgp30_init(CONFIG_SGP30_PORT, CONFIG_SGP30_TOPIC_STATUS);
#endif

#if CONFIG_SGP30_APPLI_COMPENSATION
	sgp30_init_auto_compensation();
#endif

#if CONFIG_BH1750_ENABLED
	bh1750_init(CONFIG_BH1750_PORT, CONFIG_BH1750_TOPIC_STATUS);
#endif

#if CONFIG_MH_Z19B_ENABLED
	uart_config_def_t mh_z19b_config = {
		.port = CONFIG_MH_Z19B_UART_PORT,
		.baud_rate = 9600,
		.pin_rxd = CONFIG_MH_Z19B_UART_PIN_RXD,
		.pin_txd = CONFIG_MH_Z19B_UART_PIN_TXD
	};

	mh_z19b_init(&mh_z19b_config, CONFIG_MH_Z19B_MQTT_TOPIC_STATUS, CONFIG_MH_Z19B_MQTT_TOPIC_COMMAND);
#endif

#if CONFIG_PMS7003_ENABLED
	uart_config_def_t pms7003_config = {
		.port = CONFIG_PMS7003_UART_PORT,
		.baud_rate = 9600,
		.pin_rxd = CONFIG_PMS7003_UART_PIN_RXD,
		.pin_txd = CONFIG_PMS7003_UART_PIN_TXD
	};

	pms7003_init(&pms7003_config, CONFIG_PMS7003_MQTT_TOPIC_STATUS);
#endif

#if CONFIG_RGBLED_ENABLED
	rgbled_config_t rgbled_config = {
		.gpio_red = CONFIG_RGBLED_GPIO_RED,
		.gpio_green = CONFIG_RGBLED_GPIO_GREEN,
		.gpio_blue = CONFIG_RGBLED_GPIO_BLUE,
	};

	rgbled_startup(&rgbled_config, CONFIG_RGBLED_MQTT_TOPIC_COMMAND);
#endif

#if CONFIG_FAN_ENABLED
	fan_startup(CONFIG_FAN_GPIO, CONFIG_FAN_MQTT_TOPIC_COMMAND);
#endif

#if CONFIG_ANEMOMETER_ENABLED
	anemometer_startup(CONFIG_ANEMOMETER_GPIO_A, CONFIG_ANEMOMETER_GPIO_B, CONFIG_ANEMOMETER_MQTT_TOPIC_STATUS, CONFIG_ANEMOMETER_MQTT_TOPIC_COMMAND);
#endif

#if CONFIG_TOUCH_ENABLED
	touchpad_init(CONFIG_TOUCH_PIN, CONFIG_TOUCH_MQTT_TOPIC_STATUS);
#endif

#if CONFIG_IR_ENABLED
	ir_startup(CONFIG_IR_GPIO, CONFIG_IR_MQTT_TOPIC_COMMAND);
#endif

	mqtt_start();

	while(true) {
		vTaskDelay(100 / portTICK_PERIOD_MS);
	}
}

