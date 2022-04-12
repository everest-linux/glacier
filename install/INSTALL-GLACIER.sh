#!/bin/sh
# Glacier Installation Script

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier installation script as root."
    exit
fi

mv glacier.conf /etc
mkdir /etc/glacier && echo "[ i ] Creating Glacier directory..."
mkdir /etc/glacier/pkginfo && echo "[ i ] Creating Glacier package list directory..."
mkdir /var/cache/glacier && echo "[ i ] Creating Glacier package cache..."
mkdir /var/log/glacier && echo "[ i ] Creating Glacier timestamp log..."
chmod +x ../glacier-install.sh
chmod +x ../glacier-remove.sh
chmod +x ../glacier-update.sh
chmod +x ../glacier-query.sh
chmod +x ../glacier-cache.sh
chmod +x ../glacier-cache-install.sh
chmod +x ../glacier-cache-clear.sh
chmod +x ../glacier-help.sh
echo "[ i ] Installing glacier..."
cd ../scripts
cp glacier-install.sh glacier-install
cp glacier-remove.sh glacier-remove
cp glacier-update.sh glacier-update
cp glacier-query.sh glacier-query
cp glacier-cache.sh glacier-cache
cp glacier-cache-install.sh glacier-cache-install
cp glacier-cache-clear.sh glacier-cache-clear
cp glacier-help.sh glacier-help
mv glacier-install /bin
mv glacier-remove /bin
mv glacier-update /bin
mv glacier-query /bin
mv glacier-cache /bin
mv glacier-cache-install /bin
mv glacier-cache-clear /bin
mv glacier-help /bin
echo "[ i ] Glacier has finished installing successfully."
