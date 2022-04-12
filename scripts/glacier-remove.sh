#!/bin/sh
# glacier-remove
# Script used to uninstall packages

# Require the script to be run as root
  if [[ $(/usr/bin/id -u) -ne 0 ]]; then
      echo "[ X ] Please run Glacier as root."
      exit
  fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Installing $input.tar.gz"
echo "Checking world..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/world/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in world." 1>&2
    exit 1
fi
echo "[ i ] Fetching removal instructions..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
chmod +x REMOVE.sh
./REMOVE.sh
rm /var/log/glacier/$input.timestamp
echo "[ i ] Cleaning up..."
cd ..
rm -rvf $input
rm /etc/glacier/pkginfo/$input-pkginfo.json
echo "[ i ] Operation completed."
