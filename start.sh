#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
    #Update and Upgrade
    echo "Updating and Upgrading"
    apt-get -yqq update && sudo apt-get upgrade -yqq
    #vscode
fi
