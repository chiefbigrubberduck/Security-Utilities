# Security Utilities
A set of security-oriented scripts for various purposes. Currently available scipts are:
* Mac Spoofer
* Managed to Monitor
* Folder Hardening

Check out the specified sections below for instructions on using the scripts. If you want any utilities added, open an issue and voice your request. Keep in mind these scripts are built for Linux and are for Linux only.

# Mac Spoofer
<img width="474" height="206" alt="macchanger" src="https://github.com/user-attachments/assets/1106147f-ab42-442e-9d7b-b00ff2410b09" />

### Requirements: 
1. macchanger installed, any version should work, but newest would be best.
2. You need ip link installed, though this is common on most systems. You can check by typing "ip link". If it is not installed, you can install it by running `sudo apt/yum/dnf/pkg install iproute2`

### How-to launch
After you download the script, you will have to make it executable, this can be done with chmod or through the GUI. 
A chmod example would be:
1. cd into the directory you downloaded it to (probably downloads)
2. Run `sudo chmod 777 mrmacchanger.sh` this gives it executable permission, but not root privliges.
3. Then run `sudo ./mrmacchanger.sh`
4. You can also put it in your `$PATH` by running `cp mrmacchanger.sh /usr/local/bin/mrmacchanger` (from whatever directory the script is in), and then `chmod a+rw /usr/local/bin/mrmacchanger`

### Notes:
1. This is ONLY built to work for Linux.
2. The script brings you network interface down, and then runs the macchanger command. You have to manually bring the interface back up (just turn your wifi chip on, and connect to a network)

# Managed to Monitor
A set of scripts to change your Wi-Fi card from managed to monitor mode, vice-versa. There are 2 sets of scripts, simple, and user-friendly

### Dependencies
1. aircrack-ng suite
2. iw
3. ip link
4. systemctl

### Installation
Download the script bundle you want (simple or user-friendly) from the releases page. Then decompress and extract the scripts from the .tar archive, and then follow the how-to run instructions, and the instructions to edit the simple script, if you chose to download that.

### How-to edit simple script
 1. Open the script and look in the first 1-5 lines.
 2. You will see 1 variable called INTERFACE
 3. Find the name of your wifi adapter, then enter it in the INTERFACE variable in the quotes. Example: `INTERFACE="wlp4s60"`
 4. After that save the changes to the document and follow the how-to run commands below.

### How-to run
 1. cd into the directory you downloaded the scripts into.
 2. Then run `sudo chmod 777 (MONITOR or MONITOR_SIMPLE.sh)` this makes the MONITOR.sh script executable
 3. Next run `sudo chmod 777 (MANAGED or MANAGED_SIMPLE.sh)` this a makes the MANAGED.sh script executable
 4. After that you can execute them by running `sudo ./(MANAGED OR MONITOR OR MANAGED_SIMPLE OR MONITOR_SIMPLE).sh`
 5. It will ask for your password because the script requires sudo permissions
 6. You can also add them to your `$PATH` by running `cp (your script) /usr/local/bin/(your script name, without the .sh ending)` and then `chmod a+rw /usr/local/bin/(your copied script)`

# Folder Hardening
A simple script that writes to fstab and tells your chosen folder not to let any binaries execute, increasing the safety of your device and resistance to malware.

Instructions underway

# Disclaimer
I (chiefbigrubberduck) am not responsible for any issues or problems (of any sort) regarding anything related or tangentially related to the hosted scripts. The user must be aware of what these scripts will do. They are for educational purposes only. Anything outside of what is considered "educational" is not endorsed by me, nor my collaborators. Regard the MIT License for more information.
