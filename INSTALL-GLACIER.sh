#!/bin/sh
# Glacier Installation Script

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier installation script as root."
    exit
fi

mkdir /etc/glacier && echo "[ i ] Creating /etc/glacier..."
mkdir /etc/glacier/pkginfo && echo "Creating /etc/glacier/pkginfo..."
chmod +x glacier-install.sh
chmod +x glacier-remove.sh
chmod +x glacier-update.sh
chmod +x glacier-query.sh
chmod +x glacier-help.sh
echo "[ i ] Installing glacier..."
cp glacier-install.sh glacier-install
cp glacier-remove.sh glacier-remove
cp glacier-update.sh glacier-update
cp glacier-query.sh glacier-query
cp glacier-help.sh glacier-help
mv glacier-install /bin
mv glacier-remove /bin
mv glacier-update /bin
mv glacier-query /bin
mv glacier-help /bin
echo "[ i ] Glacier has finished installing successfully."
