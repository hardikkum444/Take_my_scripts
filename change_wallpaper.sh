#THIS WORKS ONLY FOR GNOME


#!/bin/bash

WALLPAPERS_DIR="/path/to/your/dir/containing/wallpapers"

# This will select a random wallpaper from that dir
WALLPAPER=$(ls "$WALLPAPERS_DIR" | shuf -n 1)
#-n 1 specifies that only one is to be selected

# gesettings will then set the wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPERS_DIR/$WALLPAPER"


--------------------------------------------------------------------------------------------------

#working


#/etc/udev/rules.d
#sudo touch 99battery.rules
#/etc/systemd/user
#sudo touch battery@.service

#sudo udevadm control --reload-rules
#sudo udevadm trigger
#udevadm monitor --udev --environment


#udevadm info -a --path='/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:27/PNP0C0A:00/power_supply/BAT1'


    # KERNEL=="BAT1"
    # SUBSYSTEM=="power_supply"
    # DRIVER==""
    # ATTR{alarm}=="4000000"
    # ATTR{capacity}=="85"
    # ATTR{capacity_level}=="Normal"
    # ATTR{cycle_count}=="216"
    # ATTR{energy_full}=="40020000"
    # ATTR{energy_full_design}=="45000000"
    # ATTR{energy_now}=="34090000"
    # ATTR{manufacturer}=="0x53 0x75 0x6E 0x77 0x6F 0x64 0"
    # ATTR{model_name}=="0x4C 0x32 0x30 0x44 0x33 0x50 0"
    # ATTR{power/async}=="disabled"
    # ATTR{power/control}=="auto"
    # ATTR{power/runtime_active_kids}=="0"
    # ATTR{power/runtime_active_time}=="0"
    # ATTR{power/runtime_enabled}=="disabled"
    # ATTR{power/runtime_status}=="unsupported"
    # ATTR{power/runtime_suspended_time}=="0"
    # ATTR{power/runtime_usage}=="0"
    # ATTR{power_now}=="19886000"
    # ATTR{present}=="1"
    # ATTR{serial_number}=="4500"
    # ATTR{status}=="Charging"
    # ATTR{technology}=="Li-ion"
    # ATTR{type}=="Battery"
    # ATTR{voltage_min_design}=="11520000"
    # ATTR{voltage_now}=="12964000"

# [Unit]
# Description=Battery Service

# [Service]
# ExecStart=/home/man44/custom/change_wallpaper.sh %i



#--------------------------------------------------------------------------------------------------
BATTERY RULE saved in /etc/udev/rules.d


## Rule for when switching to battery
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", ENV{DISPLAY}=":0", RUN+="/usr/bin/su man44 -c /usr/local/bin/normal.sh"

# Rule for when switching to AC
ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", ENV{DISPLAY}=":0", RUN+="/usr/bin/su man44 -c /usr/local/bin/wallpaper.sh"

# ---------------------------------------------------------------------------------------------------
WALLPAPER SCRIPT saved in /usr/local/bin

#!/bin/bash

export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Path to your wallpapers directory
WALLPAPERS_DIR="/home/man44/Documents/charge"

# Select a random wallpaper from the directory
WALLPAPER=$(ls "$WALLPAPERS_DIR" | shuf -n 1)

# Set the selected wallpaper using gsettings
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPERS_DIR/$WALLPAPER"
