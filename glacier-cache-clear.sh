#!/bin/sh
# glacier-cache-clear
# Script used to clear Glacier's cache

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ i ] Clearing cache..."
cd /var/cache/glacier && rm *.tar.gz
echo "[ i ] Cache was cleared."
