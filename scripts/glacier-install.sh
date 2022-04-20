#!/bin/sh
# glacier-install
# Script used to fetch installation scripts and run them

# Define colors
export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export blue="\033[1;34m"
export reset="\033[m"

# Define unicode symbols
export check="\xE2\x9C\x93"
export error="\xE2\x9C\x95"
export warning="\x21"
export question="\x3F"

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "\033[1;31m [ $error ] \033[m Please run Glacier as root."
    exit
fi

echo "\033[1;34m [ ? ] \033[m Enter package name:" && read input
echo "\033[1;34m [ i ] \033[m Installing $input.tar.gz"
echo "Checking world..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/world/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "\033[1;31m [ $error ] \033[m Package not found." 1>&2
    exit 1
fi
echo "\033[1;34m [ i ] \033[m Unpacking $input.tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "\033[1;31m [ $error ] \033[m Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
chmod +x INSTALL.sh
chmod +x $input.ts.sh
echo "\033[1;34m [ i ] \033[m Executing installation instructions..."
./INSTALL.sh # Actually executes installation script
./$input.ts.sh
echo "\033[1;34m [ i ] \033[m Cleaning up..." # Status message
mv -v $input-pkginfo.json /etc/glacier/pkginfo
cd ..
rm -rvf $input
echo "\033[1;32m [ $check ] \033[m Operation completed."
