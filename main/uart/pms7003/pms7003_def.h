#ifndef MAIN_UART_PMS7003_PMS7003_DEF_H_
#define MAIN_UART_PMS7003_PMS7003_DEF_H_

typedef struct pms7003_data_t {
	uint16_t factory_pm_1_0;
	uint16_t factory_pm_2_5;
	uint16_t factory_pm_10_0;

	uint16_t atmospheric_pm_1_0;
	uint16_t atmospheric_pm_2_5;
	uint16_t atmospheric_pm_10_0;

	uint16_t raw_0_3_um;
	uint16_t raw_0_5_um;
	uint16_t raw_1_0_um;
	uint16_t raw_2_5_um;
	uint16_t raw_5_0_um;
	uint16_t raw_10_0_um;

	uint8_t version_number;
	uint8_t error_code;
} pms7003_data_t;

#endif /* MAIN_UART_PMS7003_PMS7003_DEF_H_ */
