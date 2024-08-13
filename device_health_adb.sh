#!/bin/bash


GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Device Health Report${NC}"
echo -e "${GREEN}---------------------${NC}"

echo -e "${GREEN}Battery Status:${NC}"
adb shell dumpsys battery | grep -E "level|health|status|voltage|temperature|technology|current_now|charge_counter"


echo -e "${GREEN}Memory Usage:${NC}"
adb shell dumpsys meminfo | grep -E "Total RAM|Free RAM|Used RAM|Cached RAM"


echo -e "${GREEN}Disk Usage:${NC}"
adb shell df | grep -E "/data|/system|/cache"


echo -e "${GREEN}CPU Usage:${NC}"
adb shell top -n 1 | head -n 10


echo -e "${GREEN}Device Information:${NC}"
adb shell getprop ro.product.model
adb shell getprop ro.product.manufacturer
adb shell getprop ro.build.version.release
adb shell getprop ro.build.display.id
adb shell getprop ro.build.version.sdk
adb shell getprop ro.build.id
adb shell getprop ro.product.name
adb shell getprop ro.product.board
adb shell getprop ro.hardware


echo -e "${GREEN}Network Information:${NC}"
adb shell dumpsys connectivity | grep -E "NetworkInfo|active network"
adb shell dumpsys wifi | grep -E "SSID|IP"
adb shell dumpsys wifi | grep -E "IP address"


echo -e "${GREEN}Battery Stats Over Time:${NC}"
adb shell dumpsys batterystats | grep -E "battery|screen_on|screen_off|charging"


echo -e "${GREEN}Recent Logcat Entries:${NC}"
adb logcat -d | tail -n 50

echo -e "${GREEN}---------------------${NC}"
echo -e "${GREEN}Report Generated Successfully.${NC}"
