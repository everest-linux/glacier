#!/bin/sh

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier uninstallation as root."
    exit
fi

echo "[ ! ] It is recommended to uninstall all Glacier packages before uninstalling Glacier."
rm -rf /etc/glacier
rm /bin/glacier-install
rm /bin/glacier-update
rm /bin/glacier-remove
rm /bin/glacier-query
rm /bin/glacier-help
