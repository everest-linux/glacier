#!/bin/sh
# glacier-cache
# Script used to download a package and cache it

# Require the script to be run as root\
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    printf "\033[1;31m [ $error ] \033[m Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
printf "\033[1;34m [ i ] \033[m Caching $input.tar.gz... "
printf "Checking world... " && wget https://github.com/everest-linux/glacier-pkgs/raw/main/world/$input.tar.gz
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Package not found. " 1>&2
    exit 1
fi
mv $input.tar.gz /var/cache/glacier
printf "\033[1;32m [ $check ] \033[m Operation completed."
