# Security Utilities
A set of security-oriented scripts for various purposes. Currently available scipts are:
* Mac Spoofer
* Managed to Monitor

Check out the specified sections below for instructions on using the scripts. If you want any utilities added, open an issue and voice your request.

## Mac Spoofer
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

## Managed to Monitor

## Disclaimer
I (chiefbigrubberduck) am not responsible for any issues or problems (of any sort) regarding anything related or tangentially related to the hosted scripts. The user must be aware of what these scripts will do. They are for educational purposes only. Anything outside of what is considered "educational" is not endorsed by me, nor my collaborators. Regard the MIT License for more information.
