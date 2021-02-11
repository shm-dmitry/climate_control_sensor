#ifndef MAIN_MH_Z19B_MH_Z19B_H_
#define MAIN_MH_Z19B_MH_Z19B_H_

#include "mh_z19b_def.h"
#include "../uart_config_def.h"

void mh_z19b_init(const uart_config_def_t * config, const char * status_topic, const char * command_topic);

#endif /* MAIN_MH_Z19B_MH_Z19B_H_ */
