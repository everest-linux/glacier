#!/bin/sh
# glacier-remove
# Script used to uninstall packages

# Define colors
export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export blue="\033[1;34m"
export reset="\033[m"

# Define unicode symbols
export check="\xE2\x9C\x93"
export error="\xE2\x9C\x95"
export warning="\x21"
export question="\x3F"

# Glacier preloading

source /etc/glacier.conf

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    printf "\033[1;31m [ $error ] \033[m Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
printf "\033[1;34m [ i ] \033[m Removing $input.tar.gz...\n"
printf "Checking world... " && wget https://github.com/everest-linux/glacier-pkgs/raw/main/world/$input.tar.gz -q --show-progress
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Package not found. " 1>&2
    exit 1
fi
printf "\033[1;34m [ i ] \033[m Unpacking $input.tar.gz...\n"
mkdir $input && mv $input.tar.gz $input && cd $input
tar -xf $input.tar.gz
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Could not unpack $input.tar.gz. " 1>&2
    exit 1
fi
chmod +x REMOVE.sh
./REMOVE.sh
rm /var/log/glacier/$input.timestamp
printf "\033[1;34m [ i ] \033[m Cleaning up... \n" # Status message
cd ..
rm -rf $input
rm /etc/glacier/pkginfo/$input-pkginfo.json
printf "\033[1;32m [ $check ] \033[m Operation completed.\n"
