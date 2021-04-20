#include "tion_bt_timeout_checker.h"

#include "../log.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"

#define TION_TIMEOUT_CHECKER_MUTEX_AWAIT ((TickType_t) 500)

static tion_bt_stop_callback_t tion_bt_timeout_check_stop_callback = NULL;
static tion_exec_command_t ** tion_bt_timeout_check_command = NULL;
static TaskHandle_t tion_bt_timeout_check_handler = NULL;
static uint8_t tion_bt_timeout_check_timeout = 0;
static SemaphoreHandle_t mutex = NULL;

static void tion_bt_timeout_callback_task(void* arg) {
	ESP_LOGE(TION_LOG, "tion_bt_timeout_check_task TIMEOUT! Restarting command.....");
	tion_bt_timeout_check_stop_callback(true);
	vTaskDelete(NULL);
}

static void tion_bt_timeout_check_task(void* arg) {
	if (*tion_bt_timeout_check_command == NULL || tion_bt_timeout_check_timeout == 0) {
		return;
	}

	uint8_t uid = (*tion_bt_timeout_check_command)->command_uuid;
	for (int i = 0; i<tion_bt_timeout_check_timeout; i++) {
		vTaskDelay(1000 / portTICK_PERIOD_MS);

		if (*tion_bt_timeout_check_command == NULL || uid != (*tion_bt_timeout_check_command)->command_uuid || tion_bt_timeout_check_timeout == 0) {
			tion_bt_timeout_check_handler = NULL;
			vTaskDelete(NULL);
			return;
		}
	}

	if (*tion_bt_timeout_check_command != NULL && uid == (*tion_bt_timeout_check_command)->command_uuid && tion_bt_timeout_check_timeout != 0) {
		xTaskCreate(tion_bt_timeout_callback_task, "tion bt timeout callback task", 4096, NULL, 10, NULL);
	}

	tion_bt_timeout_check_handler = NULL;
	vTaskDelete(NULL);
}

void tion_bt_timeout_check_init(tion_bt_stop_callback_t callback, tion_exec_command_t ** command) {
	if (callback && command) {
		tion_bt_timeout_check_stop_callback = callback;
		tion_bt_timeout_check_command = command;

		vSemaphoreCreateBinary(mutex);
	}
}

void tion_bt_timeout_check_start(uint8_t timeout) {
	if (tion_bt_timeout_check_stop_callback == NULL || tion_bt_timeout_check_command == NULL) {
		return;
	}

	if (tion_bt_timeout_check_handler || tion_bt_timeout_check_timeout > 0) {
		tion_bt_timeout_check_stop();
	}

	tion_bt_timeout_check_timeout = timeout;
	tion_bt_timeout_check_handler = NULL;
	xTaskCreate(tion_bt_timeout_check_task, "tion bt timeout checker", 4096, NULL, 10, &tion_bt_timeout_check_handler);
}

void tion_bt_timeout_check_stop() {
	tion_bt_timeout_check_timeout = 0;

	if (xSemaphoreTake(mutex, TION_TIMEOUT_CHECKER_MUTEX_AWAIT) == pdTRUE) {
		if (tion_bt_timeout_check_handler) {
			vTaskDelete(tion_bt_timeout_check_handler);
			tion_bt_timeout_check_handler = NULL;
		}
	    xSemaphoreGive(mutex);
	}
}
