#!/bin/sh
# glacier-update
# Script used to update packages

# Glacier preloading

source /etc/glacier/hooks.sh

# Require Glacier to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    printf "\033[1;31m [ $error ] \033[m Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
printf "\033[1;34m [ i ] \033[m Installing $input.tar.gz...\n"
printf "\033[1;34m [ i ] \033[m Checking databases... " && wget $GREPO1/$input.tar.gz -q --show-progress || wget $GREPO2/$input.tar.gz -q --show-progress || wget $GREPO3/$input.tar.gz -q --show-progress || wget $GREPO4/$input.tar.gz -q --show-progress || wget $GREPO5/$input.tar.gz -q --show-progress || wget $GREPO6/$input.tar.gz -q --show-progress || wget $GREPO7/$input.tar.gz -q --show-progress || wget $GREPO8/$input.tar.gz -q --show-progress
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Package not found. " 1>&2
    exit 1
fi
printf "\033[1;34m [ i ] \033[m Unpacking $input.tar.gz...\n"
mkdir $input && mv $input.tar.gz $input && cd $input
tar -xf $input.tar.gz
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Could not unpack $input.tar.gz. " 1>&2
    exit 1
fi
rm /var/log/glacier/$input.timestamp
chmod +x UPDATE.sh
chmod +x $input.ts.sh
./UPDATE.sh
./$input.ts.sh
printf "\033[1;34m [ i ] \033[m Cleaning up...\n"
mv $input-pkginfo.json /etc/glacier/pkginfo
mv $input.timestamp /var/log/glacier
cd ..
rm -rf $input
printf "\033[1;32m [ $check ] \033[m Operation completed.\n"
