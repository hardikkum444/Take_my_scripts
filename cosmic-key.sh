#!/bin/bash


GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' 




echo -e "${CYAN}==============================${NC}"
echo -e "${CYAN}       WELCOME TO COSMIC DE      ${NC}"
echo -e "${CYAN}==============================${NC}"


echo -e "${GREEN}Welcome man44 ${NC}"


echo -e "${YELLOW}System Information:${NC}"
echo -e "Kernel: $(uname -r)"
echo -e "Uptime: $(uptime -p)"


echo -e "${RED}Starting your session, please wait...${NC}"
while true; do
    for i in / - \\ \|; do
        echo -ne "\r$i"
        sleep 0.1
    done
done &


exec cosmic-session
