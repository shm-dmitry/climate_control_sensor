#ifndef MAIN_TION_TION_BT_TIMEOUT_CHECKER_H_
#define MAIN_TION_TION_BT_TIMEOUT_CHECKER_H_

#include "stdbool.h"
#include "tion_bt_command.h"

typedef void (* tion_bt_stop_callback_t)(bool allow_retry);

void tion_bt_timeout_check_init(tion_bt_stop_callback_t callback, tion_exec_command_t ** command);

void tion_bt_timeout_check_start(uint8_t timeout);

void tion_bt_timeout_check_stop();

#endif /* MAIN_TION_TION_BT_TIMEOUT_CHECKER_H_ */
