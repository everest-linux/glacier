#!/bin/sh
# glacier-update
# Script used to update packages

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Downloading $input.tar.gz..."
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not get archive for $input." 1>&2
    exit 1
fi
echo "[ i ] Unpacking $input,tar.gz..."
tar -xvf $input.tar.gz 
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
cd $input
chmod +x UPDATE.sh
./UPDATE.sh
rm /etc/glacier/pkginfo/$input-pkginfo.json
mv $input-pkginfo.json /etc/glacier/pkginfo
rm $input.tar.gz
rm INSTALL.sh
rm UPDATE.sh
rm REMOVE.sh
echo "[ i ] Operation completed."
