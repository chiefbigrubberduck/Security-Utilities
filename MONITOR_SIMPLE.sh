#!/bin/bash

INTERFACE="your wifi adapter name"
sudo ip link set $INTERFACE down
sudo airmon-ng
sudo airmon-ng check kill
sudo rfkill unblock 1
sudo iw dev $INTERFACE set type monitor
sudo ip link set $INTERFACE up
echo "----------------------------"
echo "Done, you can now close this window..."
echo "Check the Github page for updates!"
