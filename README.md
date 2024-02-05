Project info
=======

*DEPRECATED. New board/fw project in https://github.com/shm-dmitry/air-detector*

This module allows you to control climate in room.

It reports:
- CO2 value
- Temperature
- Humidity
- Pressure
- PMx value
- Illumination
- Direction and speed of air in ventilation  

It controls:
- Exhaust fan 
- Cooling fan with speed control (fan_pwm driver) 
- Control any device (except Air Conditioneers at now) via IR
- TION Breather (in development at now...) via Bluetooth

Additional features:
- Integrates with any smart-house system via MQTT protocol (over WIFI)
- Contains touchpad supports multi-click (single click, double click, tripple click etc)
- Contains RGB led to indicate some internal state you want

![photo_2021-05-06_11-19-07](https://user-images.githubusercontent.com/19342331/117265537-012f4a00-ae5d-11eb-97ac-4f9fc460ca42.jpg)

Project status
=======

Schematics is done.
Board is done.

| Sensor | Software | Hardware |
| --- | --- | --- |
| TION 3S | In progress | - |
| BME280 | OK | OK |
| SGP30 | OK | OK |
| BH1750 | OK | OK |
| MH-Z19B | OK | OK |
| PMS7003 | OK | OK |
| Internal ESP32 Touch Pin | OK | OK |
| RGB Led | OK | OK |
| FAN Switch control | OK | OK |
| FAN speed control | OK | OK |
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


