#!/bin/bash

# --- LIST AVAILABLE WIRELESS INTERFACES ---
echo "Scanning for wireless interfaces..."
INTERFACES=($(ls /sys/class/net/ | while read iface; do
    if [ -d "/sys/class/net/$iface/device/ieee80211" ]; then
        echo "$iface"
    fi
done))

if [ ${#INTERFACES[@]} -eq 0 ]; then
    echo "Error: No wireless interfaces found."
    exit 1
fi

echo "Found the following wireless cards:"
for i in "${!INTERFACES[@]}"; do
    echo "[$((i+1))] ${INTERFACES[$i]}"
done

# --- USER SELECTION ---
while true; do
    read -p "Select a card by number 1-${#INTERFACES[@]}: " choice
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#INTERFACES[@]} ]; then
        INTERFACE=${INTERFACES[$((choice-1))]}
        break
    else
        echo "Invalid selection. Try again."
    fi
done

INTERFACEMON="${INTERFACE}mon"

echo "Selected interface: $INTERFACE"
echo "Monitor interface will be: $INTERFACE"
echo "--------------------------------------"

# --- EXECUTE MONITOR MODE SETUP ---
sudo ip link set $INTERFACE down
sudo airmon-ng
sudo airmon-ng check kill
sudo rfkill unblock 1
sudo iw dev $INTERFACE set type monitor
sudo ip link set $INTERFACE up
echo "---------------------------------- "
echo "Done. Interface $INTERFACE is now in monitor mode."
echo "Check the Github page for updates!"
