#!/bin/sh
# Glacier Installation Script

mkdir /etc/glacier && echo "[ i ] Creating /etc/glacier..."
mkdir /etc/glacier/pkginfo && echo "Creating /etc/glacier/pkginfo..."
chmod +x glacier-install.sh
chmod +x glacier-remove.sh
chmod +x glacier-update.sh
chmod +x glacier-query.sh
echo "[ i ] Installing glacier..."
cp glacier-install.sh glacier-install
cp glacier-remove.sh glacier-remove
cp glacier-update.sh glacier-update
cp glacier-query.sh glacier-query
mv glacier-install /bin
mv glacier-remove /bin
mv glacier-update /bin
mv glacier-query /bin
echo "[ i ] Glacier has finished installing successfully
