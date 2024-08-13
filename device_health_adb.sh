#!/bin/bash

echo "Device Health Report"
echo "---------------------"

echo "Battery Status:"
adb shell dumpsys battery | grep -E "level|health|status|voltage|temperature"

echo "Memory Usage:"
adb shell dumpsys meminfo | grep -E "Total RAM|Free RAM"

echo "Device Information:"
adb shell getprop ro.product.model
adb shell getprop ro.product.manufacturer
adb shell getprop ro.build.version.release
adb shell getprop ro.build.display.id

echo "---------------------"
echo "Report Generated Successfully."
