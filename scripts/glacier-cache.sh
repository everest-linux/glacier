#!/bin/sh
# glacier-cache
# Script used to download a package and cache it

# Glacier preloading

source /etc/glacier.conf

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    printf "\033[1;31m [ $error ] \033[m Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
printf "\033[1;34m [ i ] \033[m Caching $input.tar.gz...\n"
printf "Checking world... " && wget $GREPO1/$input.tar.gz -q --show-progress || wget $GREPO2/$input.tar.gz -q --show-progress || wget $GREPO3/$input.tar.gz -q --show-progress || wget $GREPO4/$input.tar.gz -q --show-progress || wget $GREPO5/$input.tar.gz -q --show-progress || wget $GREPO6/$input.tar.gz -q --show-progress || wget $GREPO7/$input.tar.gz -q --show-progress || wget $GREPO8/$input.tar.gz -q --show-progress
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Package not found. " 1>&2
    exit 1
fi
mv $input.tar.gz /var/cache/glacier
printf "\033[1;32m [ $check ] \033[m Operation completed."
