# `systemctl --failed`
# `sudo journalctl -p 3 -xb`
# `sudo pacman -Sc`
# `sudo yay -Sc`
# `yay -Yc`
# `sudo pacman -Rns $(pacman -Qdtq)` || `pacman -Qdtq | pacman -Rns`
# `sudo rm -rf .cache/*`
# `du -sh /var/log/journal/` && `sudo journalctl --vacuum-time=2weeks`

#!/bin/bash
echo "Checking for failed processes..."
systemctl --failed
echo "Checking journalctl for failed operations..."
sudo journalctl -p 3 -xb
echo "Cleaning up pacman cache..."
sudo pacman -Sc
echo "Cleaning up AUR cache..."
sudo yay -Sc
echo "Cleaning up unwanted dependencies..."
yay -Yc
echo "Cleaning up orphaned packages..."
sudo pacman -Rns $(pacman -Qdtq) || pacman -Qdtq | sudo pacman -Rns
echo "Cleaning up cache files..."
sudo rm -rf ~/.cache/*
echo "Checking journal logs size..."
du -sh /var/log/journal/
echo "Vacuuming journal logs older than 2 weeks..."
sudo journalctl --vacuum-time=2weeks
echo "Cleanup completed."

