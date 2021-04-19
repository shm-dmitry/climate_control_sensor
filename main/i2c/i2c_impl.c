#include "i2c_impl.h"

#include "../log.h"
#include "string.h"
#include "freertos/semphr.h"

#define I2C_DEFAULT_SPEED 100000
#define I2C_MASTER_TX_BUF_DISABLE 0                           /*!< I2C master doesn't need buffer */
#define I2C_MASTER_RX_BUF_DISABLE 0                           /*!< I2C master doesn't need buffer */

#define I2C_MUTEX_AWAIT ((TickType_t) 500)
#define I2C_COMMAND_AWAIT (1000 / portTICK_RATE_MS)

bool port_0_registered = false;
bool port_1_registered = false;
SemaphoreHandle_t mutex_0 = NULL;
SemaphoreHandle_t mutex_1 = NULL;

esp_err_t i2c_read(i2c_port_t port, SemaphoreHandle_t mutex, uint8_t addr_id, uint8_t* buffer, uint8_t buffer_size);

esp_err_t i2c_write(i2c_port_t port, SemaphoreHandle_t mutex, uint8_t addr_id, const uint8_t* buffer, uint8_t buffer_size);

esp_err_t i2c_write_read(i2c_port_t port, SemaphoreHandle_t mutex, uint8_t addr_id, const uint8_t* write_buffer, uint8_t write_buffer_size, uint8_t* read_buffer, uint8_t read_buffer_size);

esp_err_t i2c_read_port0(uint8_t addr_id, uint8_t* buffer, uint8_t buffer_size) {
	return i2c_read(I2C_NUM_0, mutex_0, addr_id, buffer, buffer_size);
}

esp_err_t i2c_read_port1(uint8_t addr_id, uint8_t* buffer, uint8_t buffer_size) {
	return i2c_read(I2C_NUM_1, mutex_1, addr_id, buffer, buffer_size);
}

esp_err_t i2c_write_port0(uint8_t addr_id, const uint8_t* buffer, uint8_t buffer_size) {
	return i2c_write(I2C_NUM_0, mutex_0, addr_id, buffer, buffer_size);
}

esp_err_t i2c_write_port1(uint8_t addr_id, const uint8_t* buffer, uint8_t buffer_size) {
	return i2c_write(I2C_NUM_1, mutex_1, addr_id, buffer, buffer_size);
}

esp_err_t i2c_write_read_port0(uint8_t addr_id, const uint8_t* write_buffer, uint8_t write_buffer_size, uint8_t* read_buffer, uint8_t read_buffer_size) {
	return i2c_write_read(I2C_NUM_0, mutex_0, addr_id, write_buffer, write_buffer_size, read_buffer, read_buffer_size);
}

esp_err_t i2c_write_read_port1(uint8_t addr_id, const uint8_t* write_buffer, uint8_t write_buffer_size, uint8_t* read_buffer, uint8_t read_buffer_size) {
	return i2c_write_read(I2C_NUM_1, mutex_1, addr_id, write_buffer, write_buffer_size, read_buffer, read_buffer_size);
}

bool i2c_init_driver(i2c_port_t port, int gpio_sda, int gpio_scl){
	if (port != I2C_NUM_0 && port != I2C_NUM_1) {
		return false;
	}

    i2c_config_t conf = {
        .mode = I2C_MODE_MASTER,
        .sda_io_num = gpio_sda,
        .sda_pullup_en = GPIO_PULLUP_ENABLE,
        .scl_io_num = gpio_scl,
        .scl_pullup_en = GPIO_PULLUP_ENABLE,
        .master.clk_speed = I2C_DEFAULT_SPEED,
        // .clk_flags = 0,          /*!< Optional, you can use I2C_SCLK_SRC_FLAG_* flags to choose i2c source clock here. */
    };

    if (i2c_param_config(port, &conf)) {
		ESP_LOGE(I2C_LOG, "i2c_param_config failed");
		return false;
    }
    if(i2c_driver_install(port, conf.mode, I2C_MASTER_RX_BUF_DISABLE, I2C_MASTER_TX_BUF_DISABLE, 0)) {
		ESP_LOGE(I2C_LOG, "i2c_driver_install failed");
		return false;
    }

    if (port == I2C_NUM_0) {
    	vSemaphoreCreateBinary(mutex_0);

    	if (mutex_0 == NULL) {
    	    ESP_LOGE(I2C_LOG, "Cant init semaphore#0");
    		return false;
    	}
    } else {
    	vSemaphoreCreateBinary(mutex_1);

    	if (mutex_1 == NULL) {
    	    ESP_LOGE(I2C_LOG, "Cant init semaphore#1");
    		return false;
    	}
    }

    ESP_LOGI(I2C_LOG, "I2C port %d with pins sda %d / scl %d initialized", port, gpio_sda, gpio_scl);

    return true;
}


void i2c_register_port(i2c_port_t port, int gpio_sda, int gpio_scl) {
	switch (port) {
		case I2C_NUM_0:
			if (!port_0_registered) {
				if (i2c_init_driver(port, gpio_sda, gpio_scl)) {
					port_0_registered = true;
				}
			}
			break;
		case I2C_NUM_1:
			if (!port_1_registered) {
				if (i2c_init_driver(port, gpio_sda, gpio_scl)) {
					port_1_registered = true;
				}
			}
			break;
		default:
			ESP_LOGE(I2C_LOG, "Unknown I2C port requested: %d", port);
			break;
	}
}

i2c_handler_t * i2c_get_handlers(i2c_port_t port){
	switch (port) {
		case I2C_NUM_0:
			if (!port_0_registered) {
				ESP_LOGE(I2C_LOG, "I2C port %d not initialized yet", port);
				return NULL;
			}
			break;
		case I2C_NUM_1:
			if (!port_1_registered) {
				ESP_LOGE(I2C_LOG, "I2C port %d not initialized yet", port);
				return NULL;
			}
			break;
		default:
			ESP_LOGE(I2C_LOG, "Unknown I2C port requested: %d", port);
			return NULL;
	}

    i2c_handler_t * result = (i2c_handler_t*) malloc(sizeof(i2c_handler_t));
    memset(result, 0, sizeof(i2c_handler_t));

    result->read = (port == I2C_NUM_0 ? i2c_read_port0 : i2c_read_port1);
    result->write = (port == I2C_NUM_0 ? i2c_write_port0 : i2c_write_port1);
    result->write_read = (port == I2C_NUM_0 ? i2c_write_read_port0 : i2c_write_read_port1);

    return result;
}

esp_err_t i2c_read(i2c_port_t port, SemaphoreHandle_t mutex, uint8_t addr_id, uint8_t* buffer, uint8_t buffer_size) {
	ESP_LOGI(I2C_LOG, "i2c_read send request to port %d / addr %02x", port, addr_id);

    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    esp_err_t ret = i2c_master_write_byte(cmd, (addr_id << 1) | I2C_MASTER_READ, true);
    if (ret) {
    	ESP_LOGE(I2C_LOG, "i2c_read Cant write address %d to port %d : %d", addr_id, port, ret);
    	i2c_cmd_link_delete(cmd);
    	return ret;
    }

    memset(buffer, 0xAB, buffer_size);

    if (buffer_size > 1) {
		ret = i2c_master_read(cmd, buffer, buffer_size - 1, I2C_MASTER_ACK);
		if (ret) {
			ESP_LOGE(I2C_LOG, "i2c_read Cant read data from port %d addr %02x : %d", port, addr_id, ret);
			i2c_cmd_link_delete(cmd);
			return ret;
		}
    }

	ret = i2c_master_read(cmd, buffer + buffer_size - 1, 1, I2C_MASTER_NACK);
	if (ret) {
		ESP_LOGE(I2C_LOG, "i2c_read Cant read data from port %d addr %02x : %d", port, addr_id, ret);
		i2c_cmd_link_delete(cmd);
		return ret;
	}

    i2c_master_stop(cmd);

	if (xSemaphoreTake(mutex, I2C_MUTEX_AWAIT) != pdTRUE) {
		ESP_LOGE(I2C_LOG, "i2c_read port %d take mutex timeout", port);
		return ESP_ERR_TIMEOUT;
	}

    // ecev!
    ret = i2c_master_cmd_begin(port, cmd, I2C_COMMAND_AWAIT);
    if (ret) {
    	ESP_LOGE(I2C_LOG, "i2c_read exec command faileod to port %d addr %02x : %d", port, addr_id, ret);
    }

    xSemaphoreGive(mutex);

    i2c_cmd_link_delete(cmd);

    if (ret == ESP_OK) {
    	ESP_LOGI(I2C_LOG, "i2c_read received buffer to port %d / addr %02x", port, addr_id);
		ESP_LOG_BUFFER_HEXDUMP(I2C_LOG, buffer, buffer_size, ESP_LOG_INFO);
    }


    return ret;
}

esp_err_t i2c_write(i2c_port_t port, SemaphoreHandle_t mutex, uint8_t addr_id, const uint8_t* buffer, uint8_t buffer_size) {
	ESP_LOGI(I2C_LOG, "i2c_write sending buffer to port %d / addr %02x", port, addr_id);

    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    esp_err_t ret = i2c_master_write_byte(cmd, (addr_id << 1) | I2C_MASTER_WRITE, true);
    if (ret) {
    	ESP_LOGE(I2C_LOG, "Cant write address %d to port %d : %d", addr_id, port, ret);
    	i2c_cmd_link_delete(cmd);
    	return ret;
    }

    if (buffer && buffer_size) {
    	ESP_LOG_BUFFER_HEXDUMP(I2C_LOG, buffer, buffer_size, ESP_LOG_INFO);
    	ret = i2c_master_write(cmd, buffer, buffer_size, true);
        if (ret) {
        	ESP_LOGE(I2C_LOG, "Cant send buffer port %d : %d", port, ret);
        	i2c_cmd_link_delete(cmd);
        	return ret;
        }
    }
    i2c_master_stop(cmd);

	if (xSemaphoreTake(mutex, I2C_MUTEX_AWAIT) != pdTRUE) {
		ESP_LOGE(I2C_LOG, "i2c_write port %d addr_id %d take mutex timeout", port, addr_id);
    	i2c_cmd_link_delete(cmd);
		return ESP_ERR_TIMEOUT;
	}

    // ecev!
    ret = i2c_master_cmd_begin(port, cmd, I2C_COMMAND_AWAIT);
    if (ret) {
    	ESP_LOGE(I2C_LOG, "i2c_write exec command failed to port %d addr %02x : %d", port, addr_id, ret);
    }

    xSemaphoreGive(mutex);

	i2c_cmd_link_delete(cmd);

    return ret;
}

esp_err_t i2c_write_read(i2c_port_t port, SemaphoreHandle_t mutex, uint8_t addr_id, const uint8_t* write_buffer, uint8_t write_buffer_size, uint8_t* read_buffer, uint8_t read_buffer_size) {
	ESP_LOGI(I2C_LOG, "i2c_write_read send request to port %d / addr %02x", port, addr_id);

	memset(read_buffer, 0xAB, read_buffer_size);

	i2c_cmd_handle_t cmd = i2c_cmd_link_create();
	i2c_master_start(cmd);
	esp_err_t ret = i2c_master_write_byte(cmd, (addr_id << 1) | I2C_MASTER_WRITE, true);
	if (ret) {
		ESP_LOGE(I2C_LOG, "i2c_write_read Cant write address %d to port %d : %d", addr_id, port, ret);
		i2c_cmd_link_delete(cmd);
		return ret;
	}

	if (write_buffer && write_buffer_size) {
		ret = i2c_master_write(cmd, write_buffer, write_buffer_size, true);
		if (ret) {
			ESP_LOGE(I2C_LOG, "i2c_write_read Cant write data to port %d addr %02x : %d", port, addr_id, ret);
			i2c_cmd_link_delete(cmd);
			return ret;
		}
	}

	i2c_master_start(cmd);
	ret = i2c_master_write_byte(cmd, (addr_id << 1) | I2C_MASTER_READ, true);
	if (ret) {
		ESP_LOGE(I2C_LOG, "i2c_write_read Cant read address %d from port %d : %d", addr_id, port, ret);
		i2c_cmd_link_delete(cmd);
		return ret;
	}

	if (read_buffer_size > 1) {
		ret = i2c_master_read(cmd, read_buffer, read_buffer_size - 1, I2C_MASTER_ACK);
		if (ret) {
			ESP_LOGE(I2C_LOG, "i2c_write_read Cant read data from port %d addr %02x : %d", port, addr_id, ret);
			i2c_cmd_link_delete(cmd);
			return ret;
		}
	}

	ret = i2c_master_read(cmd, read_buffer + read_buffer_size - 1, 1, I2C_MASTER_NACK);
	if (ret) {
		ESP_LOGE(I2C_LOG, "i2c_write_read Cant read data from port %d addr %02x : %d", port, addr_id, ret);
		i2c_cmd_link_delete(cmd);
		return ret;
	}

	i2c_master_stop(cmd);

	if (xSemaphoreTake(mutex, I2C_MUTEX_AWAIT) != pdTRUE) {
		ESP_LOGE(I2C_LOG, "i2c_write_read port %d take mutex timeout", port);
		return ESP_ERR_TIMEOUT;
	}

	// ecev!
	ret = i2c_master_cmd_begin(port, cmd, I2C_COMMAND_AWAIT);
	if (ret) {
		ESP_LOGE(I2C_LOG, "i2c_write_read exec command faileod to port %d addr %02x : %d", port, addr_id, ret);
	}

	xSemaphoreGive(mutex);

	i2c_cmd_link_delete(cmd);

	if (ret == ESP_OK) {
		ESP_LOGI(I2C_LOG, "i2c_write_read received buffer to port %d / addr %02x", port, addr_id);
		ESP_LOG_BUFFER_HEXDUMP(I2C_LOG, read_buffer, read_buffer_size, ESP_LOG_INFO);
	}

	return ret;
}

