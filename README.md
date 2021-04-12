Project status
=======

Schematics is done.
Board is done.

| Sensor | Software | Hardware |
| --- | --- | --- |
| TION 3S | Not tested yet | - |
| BME280 | OK | OK |
| SGP30 | OK | OK |
| BH1750 | OK | OK |
| MH-Z19B | OK | OK |
| PMS7003 | OK | OK |
| Internal ESP32 Touch Pin | OK | OK |
| RGB Led | OK | OK |
| FAN Switch control | OK | OK |
| IR Transmitter | OK | OK |
| Anemometer | OK | OK |


Install guide
===========

Hardware:

1. Install EAGLE. Freeware version is OK: https://www.autodesk.com/products/eagle/free-download
2. Open board (lw_board.brd)
3. Generate CAM data and make order on any factory


Software
1. Install ESP-IDF SDK https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html
2. Clone and open project. 
3. Open `sdkconfig` and setup project settings. You can enable or disable unused options in `Climate Control Configuration` menu.
4. Build and flash ESP32 Devkit


------

This is firmware for a climate control device, based on ESP32 DevKit board

Features

- Connected to MQTT broker via WIFI
- Control TION 3S via BlueTooth module

> Listen topic#1 for a commands to change TION state
>
> Periodically request current state from TION and published it to topic#2

- Published current pressure, temperature and humidity to a MQTT topic (uses BME280 sensor)
- Published current TVOC and eCO2 to a MQTT topic (uses SGP30 sensor)

> Also periodically applied humidity compensation from BME280 sensor (if configured)

- Published current illumination to a MQTT topic (uses BH1750 sensor)
- Published current CO2 to a MQTT topic (uses MH-Z19B sensor)

> Also listen topic for a calibration command 

- Published current PM1.0, PM2.5 and PM10.0 to a MQTT topic (uses PMS7003 sensor)
- Listen for a topic to control RGB Led
- Listen for a topic to control external fan
- Works with sensor button (uses internal ESP32 touch sensor) and send ON_CLICK(clicks count) command to topic. Support double-click, tripple-click, etc.
- Works with anemometer (published air speed, air consumption and air direction to topic)

-----

Sensors and devices

- TION 3S 

> Thanks to:
>
> TION API [unofficial] Python impl https://github.com/TionAPI/tion_python
> 
> ESP BLE example https://github.com/espressif/esp-idf/blob/6e77694/examples/bluetooth/bluedroid/ble/gatt_client/tutorial/Gatt_Client_Example_Walkthrough.md
> 
> https://habr.com/ru/post/457670/

- BME280

> Thanks to
>
> https://github.com/finitespace/BME280

- SGP30

> Thanks to
>
> https://github.com/adafruit/Adafruit_SGP30
>
> https://github.com/sparkfun/SparkFun_SGP30_Arduino_Library

- BH1750

> Thanks to
>
> https://github.com/claws/BH1750

- MH-Z19B

> Thanks to
>
> https://github.com/strange-v/MHZ19

- PMS7003

> Thanks to
> 
> https://github.com/Ptelka/PMS7003
>
> https://www.espruino.com/datasheets/PMS7003.pdf
>
> https://github.com/jmstriegel/Plantower_PMS7003

