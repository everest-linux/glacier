#!/bin/sh
# Glacier Installation Script

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier installation script as root."
    exit
fi

mv ../scripts/glacier.conf /etc
mkdir /etc/glacier && echo "[ i ] Creating Glacier directory..."
mkdir /etc/glacier/pkginfo && echo "[ i ] Creating Glacier package list directory..."
mkdir /var/cache/glacier && echo "[ i ] Creating Glacier package cache..."
mkdir /var/log/glacier && echo "[ i ] Creating Glacier timestamp log..."
mv ../scripts/hooks.sh /etc/glacier
chmod +x ../scripts/glacier
echo "[ i ] Installing glacier..."
cd ../scripts
mv glacier /bin
echo "[ i ] Glacier has finished installing successfully."
