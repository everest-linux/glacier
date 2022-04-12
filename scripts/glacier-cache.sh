#!/bin/sh
# glacier-cache
# Script used to download a package and cache it

# Require the script to be run as root
echo "[ ? ] Enter package name:" && read input
echo "[ i ] Installing $input.tar.gz"
echo "Checking world..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/world/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in world." 1>&2
    exit 1
fi
echo "[ i ] Unpacking $input.tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Caching $input.tar.gz"
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not get archive for $input." 1>&2
    exit 1
fi
mv $input.tar.gz /var/cache/glacier
echo "[ i ] Operation completed."
