#!/bin/sh

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier update script as root."
    exit
fi

echo "[ i ] Removing outdated binaries..."
rm /bin/glacier-install
rm /bin/glacier-update
rm /bin/glacier-remove
rm /bin/glacier-query
rm /bin/glacier-help
echo "[ i ] Marking new binaries as executable..."
chmod +x glacier-install.sh
chmod +x glacier-update.sh
chmod +x glacier-remove.sh
chmod +x glacier-query.sh
chmod +x glacier-help.sh
echo "[ i ] Preparing to install new binaries..."
cp glacier-install.sh glacier-install
cp glacier-update.sh glacier-update
cp glacier-remove.sh glacier-remove
cp glacier-query.sh glacier-query
cp glacier-help.sh glacier-help
echo "[ i ] Installing new binaries..."
mv glacier-install /bin
mv glacier-update /bin
mv glacier-remove /bin
mv glacier-query /bin
mv glacier-help /bin
echo "[ i ] Glacier was successfully updated to the latest version."
