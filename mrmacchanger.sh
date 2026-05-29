#!/bin/bash

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
    if [[ "$choice" =~ ^[0-11]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#INTERFACES[@]} ]; then
        SELECTED=${INTERFACES[$((choice-1))]}
        break
    else
        echo "Invalid selection. Try again."
    fi
done

echo "The MAC address of $INTERFACES will be changed..."
echo "----------------------"

# 1. Bring the interface DOWN
sudo ip link set "$INTERFACES" down

# 2. Change the MAC
sudo macchanger -b -r "$INTERFACES"

# 3. OPTIONAL: Bring the interface back UP, disabled for security reasons
# 4. The -r switch makes it a completely random, and the -b switch makes it look as if the device originated with the address macchanger is giving it, and was never changed. ;)
echo "----------------"
echo "Done."

