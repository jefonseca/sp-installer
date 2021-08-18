Installer script for player service from smartplayer.org

## Installation

 1. Download and install the Raspberry PI OS lite:
    https://www.raspberrypi.org/software/operating-systems/
 2. Before inserting the MicroSD card on the raspberry, create an empty file named "ssh" inside the boot partition to be able to connect through ssh or use the following instructions https://www.raspberrypi.org/documentation/computers/remote-access.html#setting-up-an-ssh-server
 3. Connect to the raspberry using ssh and pi user (or use a keyboard)
 4. Input the following command in the command line: ``curl -s -L https://raw.githubusercontent.com/jefonseca/sp-installer/main/bin/install.sh | bash``
 5. Wait for the script to install everything and reboot with ``sudo reboot``
