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

# Glacier preloading

source /etc/glacier/hooks.sh

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    printf "\033[1;31m [ \xE2\x9C\x95 ] \033[m Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
printf "\033[1;34m [ i ] \033[m Installing $input.tar.gz...\n"
printf "\033[1;34m [ i ] \033[m Checking databases... " && wget $GREPO1/$input.tar.gz -q --show-progress || wget $GREPO2/$input.tar.gz -q --show-progress || wget $GREPO3/$input.tar.gz -q --show-progress || wget $GREPO4/$input.tar.gz -q --show-progress || wget $GREPO5/$input.tar.gz -q --show-progress || wget $GREPO6/$input.tar.gz -q --show-progress || wget $GREPO7/$input.tar.gz -q --show-progress || wget $GREPO8/$input.tar.gz -q --show-progress
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ \xE2\x9C\x95 ] \033[m Package not found. " 1>&2
    exit 1
fi
printf "\033[1;34m [ i ] \033[m Unpacking $input.tar.gz...\n"
mkdir $input && mv $input.tar.gz $input && cd $input
tar -xf $input.tar.gz
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ \xE2\x9C\x95 ] \033[m Could not unpack $input.tar.gz. " 1>&2
    exit 1
fi
chmod +x INSTALL.sh
chmod +x $input.ts.sh
printf "\033[1;34m [ i ] \033[m Executing installation instructions...\n"
./INSTALL.sh # Actually executes installation script
./$input.ts.sh
printf "\033[1;34m [ i ] \033[m Cleaning up...\n" # Status message
mv $input-pkginfo.json /etc/glacier/pkginfo
cd ..
rm -rf $input
printf "\033[1;32m [ \xE2\x9C\x93 ] \033[m Operation completed.\n"
