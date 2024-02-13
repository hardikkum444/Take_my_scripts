#!/bin/bash

option=$(echo -e "Poweroff\nReboot\nLogout" | dmenu -l 10 -i -p "Select an option:")

case "$option" in
    "Poweroff")
        /sbin/poweroff
        ;;
    "Reboot")
        /sbin/reboot
        ;;
    "Logout")
        pkill -KILL -u "$USER"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
