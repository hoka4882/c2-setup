#!/bin/bash

install_apache2 () {
    apt-get -yqq install apache2
}

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
    #Suppress "Daemons using outdated libraries" with an auto restart daemon configuration
    sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf

    #Update and Upgrade
    echo "[start.sh] Updating and Upgrading"
    apt-get -yqq update && sudo apt-get upgrade -yqq > apt-get.log

    echo "[start.sh] Installing apache"
    install_apache2
fi
