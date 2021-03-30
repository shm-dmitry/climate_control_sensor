#include "touchpad_api.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/touch_pad.h"
#include "soc/rtc_periph.h"
#include "soc/sens_periph.h"

#include "../../log.h"

// based on https://github.com/espressif/esp-idf/blob/master/examples/peripherals/touch_pad_interrupt/main/esp32/tp_interrupt_main.c

#define TOUCHPAD_THRESH_NO_USE   (0)
#define TOUCHPAD_FILTER_TOUCH_PERIOD (10)

static touch_pad_t touchpad_index;
static touchpad_callback_t touchpad_callback = NULL;
static volatile uint8_t touchpad_pressed = TOUCHPAD_IDLE;

static void touchpad_isr(void *arg) {
	uint32_t pad_intr = touch_pad_get_status();
	touch_pad_clear_status();

	if ((pad_intr >> touchpad_index) & 0x01) {
		touchpad_pressed = TOUCHPAD_ON_KEY_DOWN;
	}
}

static void touchpad_listener(void* arg) {
	uint8_t last_touchpad_pressed = TOUCHPAD_IDLE;
	for (;;) {
		vTaskDelay(100 / portTICK_PERIOD_MS);
		uint8_t value = touchpad_pressed;
		if (value != last_touchpad_pressed) {
			ESP_LOGI(TOUCH_LOG, "OnEvent: %d", value);
			last_touchpad_pressed = value;
    		touchpad_callback(value);
		}

		if (value == TOUCHPAD_ON_KEY_DOWN) {
			touchpad_pressed = TOUCHPAD_ON_KEY_UP;
		} else if (value == TOUCHPAD_ON_KEY_UP) {
			touchpad_pressed = TOUCHPAD_IDLE;
		}
//
//		uint16_t temp = 0;
//		if (!touch_pad_read_filtered(touchpad_index, &temp)) {
//			ESP_LOGI(TOUCH_LOG, "touch_pad_read_filtered == %d", temp);
//		}
	}
}

esp_err_t touchpad_setup(touch_pad_t pad, touchpad_callback_t callback) {
	touchpad_index = pad;
	touchpad_callback = callback;

	esp_err_t res = touch_pad_init();
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_init error %d", res);
		return res;
	}

	res = touch_pad_set_fsm_mode(TOUCH_FSM_MODE_TIMER);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_set_fsm_mode error %d", res);
		return res;
	}

	res = touch_pad_set_voltage(TOUCH_HVOLT_2V7, TOUCH_LVOLT_0V5, TOUCH_HVOLT_ATTEN_1V);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_set_voltage error %d", res);
		return res;
	}

	res = touch_pad_config(pad, TOUCHPAD_THRESH_NO_USE);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_config error %d", res);
		return res;
	}

	res = touch_pad_filter_start(TOUCHPAD_FILTER_TOUCH_PERIOD);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_filter_start error %d", res);
		return res;
	}

	uint16_t touch_value = 0;
	res = touch_pad_read_filtered(pad, &touch_value);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_read_filtered error %d", res);
		return res;
	}

	ESP_LOGI(TOUCH_LOG, "touch_pad_read_filtered: readed value %d", touch_value);

	res = touch_pad_set_thresh(pad, touch_value * 2 / 3);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_set_thresh error %d", res);
		return res;
	}

	res = touch_pad_isr_register(touchpad_isr, NULL);
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_isr_register error %d", res);
		return res;
	}

	xTaskCreate(touchpad_listener, "on touch pad listener", 2048, NULL, 10, NULL);

	res = touch_pad_intr_enable();
	if (res) {
		ESP_LOGE(TOUCH_LOG, "touch_pad_intr_enable error %d", res);
		return res;
	}

	return ESP_OK;
}
