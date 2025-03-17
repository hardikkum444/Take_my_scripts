#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}* Cleaning APT cache *${NC}"
sudo apt clean
echo -e "${GREEN}* Removing outdated packages *${NC}"
sudo apt autoclean

if ! command -v deborphan &> /dev/null; then
    echo -e "${GREEN}* Installing deborphan *${NC}"
    sudo apt install -y deborphan
fi

echo -e "${GREEN}* Removing orphaned packages *${NC}"
sudo apt remove --purge -y $(deborphan)

echo -e "${GREEN}* Removing unused dependencies *${NC}"
sudo apt autoremove -y

echo -e "${GREEN}* APT cleanup completed *${NC}"
