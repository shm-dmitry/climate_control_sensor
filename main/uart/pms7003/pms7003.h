#ifndef MAIN_UART_PMS7003_PMS7003_H_
#define MAIN_UART_PMS7003_PMS7003_H_

#include "pms7003_api.h"

void pms7003_init(const uart_config_def_t * config, const char * status_topic);

#endif /* MAIN_UART_PMS7003_PMS7003_H_ */
