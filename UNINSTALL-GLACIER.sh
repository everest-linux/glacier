#!/bin/sh

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier uninstallation as root."
    exit
fi

