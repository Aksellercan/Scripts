#!/bin/bash
while true; do
    clear
	status=$(cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status)
    time=$(cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_suspended_time)
    powerInfo=$(cat /proc/driver/nvidia/gpus/0000:01:00.0/power)
    powerStatus=$(cat /sys/bus/pci/devices/0000:01:00.0/power_state)
	if [[ "$status" == "active" ]]; then
		color=$(tput setaf 2) # Green (active)
	elif [[ "$status" == "suspended" ]]; then
		color=$(tput setaf 4) # Blue suspended/sleeping
	elif [[ "$status" == "suspending" || "$status" == "resuming" ]]; then
		color=$(tput setaf 3) # Yellow (resuming or suspending)
	else
		color=$(tput setaf 1) # Red (error)
	fi
	reset=$(tput sgr0)
    echo -e "${powerInfo}\n\nPower State: ${powerStatus}\n\nRuntime Status: ${color}${status}${reset}\n\nRuntime Status Time: ${time}"
    sleep 2 # Refresh every 2 seconds
done
