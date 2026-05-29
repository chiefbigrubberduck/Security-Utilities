#!/bin/bash

INTERFACE="your wifi adapter name"
sudo ip link set $INTERFACE down
sudo iw dev $INTERFACE set type managed
sudo ip link set $INTERFACE up
sudo systemctl start NetworkManager
sudo ip link set $INTERFACE down
echo "----------------------------"
echo "Done, you can close the window..."
echo "Check the Github page for updates!"
