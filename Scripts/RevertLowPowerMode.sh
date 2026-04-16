#! /bin/bash
echo "Reverting changes..."
/usr/bin/powerprofilesctl set balanced
echo "Changed power profile to balanced"
/usr/bin/kscreen-doctor output.eDP-1.mode.1920x1080@165
echo "Changed refresh rate to 165Hz"
