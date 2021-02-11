#ifndef MAIN_UART_UART_CONFIG_DEF_H_
#define MAIN_UART_UART_CONFIG_DEF_H_

#include "driver/uart.h"

typedef struct uart_config_def_t {
	uart_port_t port;
	int baud_rate;
	int pin_rxd;
	int pin_txd;
} uart_config_def_t;

#endif /* MAIN_UART_UART_CONFIG_DEF_H_ */
