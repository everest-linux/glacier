#!/bin/sh
# glacier-remove
# Script used to uninstall packages

# Require the script to be run as root
  if [[ $(/usr/bin/id -u) -ne 0 ]]; then
      echo "[ X ] Please run Glacier as root."
      exit
  fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Preparing to remove $input..."
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not get archive for $input." 1>&2
    exit 1
fi
echo "[ i ] Fetching removal instructions..."
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
cd $input
chmod +x REMOVE.sh
./REMOVE.sh
echo "[ i ] Cleaning up..."
rm /etc/glacier/pkginfo/$input-pkginfo.json
rm INSTALL.sh
rm UPDATE.sh
rm REMOVE.sh
rm LICENSE.md
rm $input.tar.gz
rm $input-pkginfo.json
rm $input
echo "[ i ] Operation completed."
