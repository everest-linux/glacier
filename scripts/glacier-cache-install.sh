#!/bin/sh
# glacier-cache-install
# Script used to install cached packages

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
printf "\033[1;34m [ i ] \033[m Checking cache for $input.tar.gz... "
cd /var/cache/glacier && cp $input.tar.gz /tmp && cd /tmp
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Could not fetch package from cache. " 1>&2
    exit 1
fi
printf "\033[1;34m [ i ] \033[m Unpacking $input.tar.gz... "
mkdir $input && mv $input.tar.gz $input && cd $input
tar -xf $input.tar.gz
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Could not unpack $input.tar.gz. " 1>&2
    exit 1
fi
chmod +x INSTALL.sh
chmod +x $input.ts.sh
./INSTALL.sh # Actually executes installation script
./$input.ts.sh
printf "\033[1;34m [ i ] \033[m Cleaning up... " # Status message
mv -v $input-pkginfo.json /etc/glacier/pkginfo
cd ..
rm -rvf $input
printf "\033[1;32m [ $check ] \033[m Operation completed."
