#!/bin/bash

output=$(sudo smartctl -A /dev/sdX)

reallocated=$(echo "$output" | grep "Reallocated_Sector_Ct" | awk '{print $10}')
pending=$(echo "$output" | grep "Current_Pending_Sector" | awk '{print $10}')

if [[ $reallocated -eq 0 && $pending -eq 0 ]]; then
  echo "Disk health: 100%"
else
  health=$((100 - (reallocated + pending)))
  echo "Disk health: $health%"
fi
