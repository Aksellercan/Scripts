#!/bin/bash
set -e

for device in /sys/bus/usb/devices/*/power/control; do
    if [[ -f "$device" ]]; then
        echo on > "$device"
    fi
done
