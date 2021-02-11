#include "ttp223_api.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"

// https://github.com/espressif/esp-idf/blob/master/examples/peripherals/gpio/generic_gpio/main/gpio_example_main.c

ttp223_callback_t ttp223_callback = NULL;
xQueueHandle ttp223_gpio_evt_queue = NULL;
uint8_t ttp223_gpio = 0;

static void IRAM_ATTR ttp223_gpio_isr_handler(void* arg) {
    xQueueSendFromISR(ttp223_gpio_evt_queue, 0x00, NULL);
}

static void ttp223_gpio_onchange_queue_listener(void* arg) {
	uint32_t temp;
    for(;;) {
        if(xQueueReceive(ttp223_gpio_evt_queue, &temp, portMAX_DELAY)) {
        	if (ttp223_callback) {
				uint8_t value = gpio_get_level(ttp223_gpio);
				if (value) {
					ttp223_callback(TTP223_ON_KEY_DOWN);
				} else {
					ttp223_callback(TTP223_ON_KEY_UP);
				}
        	}
        }
    }
}

esp_err_t ttp223_init(uint8_t gpio, ttp223_callback_t callback) {
	gpio_config_t config = {
		.intr_type = GPIO_INTR_POSEDGE,
		.pin_bit_mask = (1 << gpio),
		.mode = GPIO_MODE_INPUT,
		.pull_down_en = GPIO_PULLDOWN_ENABLE,
		.pull_up_en = GPIO_PULLUP_DISABLE
	};

	esp_err_t res = gpio_config(&config);
	if (res) {
		return res;
	}

	res = gpio_set_intr_type(gpio, GPIO_INTR_ANYEDGE);
	if (res) {
		return res;
	}

	ttp223_gpio = gpio;
	ttp223_callback = callback;

	ttp223_gpio_evt_queue = xQueueCreate(10, sizeof(uint32_t));
	xTaskCreate(ttp223_gpio_onchange_queue_listener, "onchange gpio listener", 2048, NULL, 10, NULL);

	res = gpio_install_isr_service(0);
	if (res) {
		return res;
	}

    res = gpio_isr_handler_add(gpio, ttp223_gpio_isr_handler, NULL);
	if (res) {
		return res;
	}

	return ESP_OK;
}
