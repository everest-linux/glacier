#!/bin/sh
# glacier-install
# Script used to fetch installation scripts and run them

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Installing $input.tar.gz"
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not get archive for $input." 1>&2
    exit 1
fi
echo "[ i ] Unpacking $input.tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
chmod +x INSTALL.sh
chmod +x $input.ts.sh
./INSTALL.sh # Actually executes installation script
./$input.ts.sh
echo "[ i ] Cleaning up..." # Status message
mv -v $input-pkginfo.json /etc/glacier/pkginfo
cd ..
rm -rvf $input
echo "[ i ] Operation completed."
