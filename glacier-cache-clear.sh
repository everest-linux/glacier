#!/bin/sh
# glacier-cache-clear
# Script used to clear Glacier's cache

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ i ] Clearing cache..."
rm -rf /var/cache/glacier
echo "[ i ] Cache was cleared."
