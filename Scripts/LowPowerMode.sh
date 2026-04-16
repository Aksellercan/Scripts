#! /bin/bash

/usr/bin/powerprofilesctl set power-saver
echo "Changed power profile to power-saver"
/usr/bin/kscreen-doctor output.eDP-1.mode.1920x1080@60
echo "Changed refresh rate to 60Hz"
