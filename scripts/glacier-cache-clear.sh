#!/bin/sh
# glacier-cache-clear
# Script used to clear Glacier's cache

# Glacier preloading

source /etc/glacier.conf

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    printf "\033[1;31m [ $error ] \033[m Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ i ] \033[m Clearing cache... "
cd /var/cache/glacier && rm *.tar.gz
printf "\033[1;32m [ $check ] \033[m Cache cleared."
