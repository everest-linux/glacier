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
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz || echo "[ X ] Failed to prepare $input for removal."
echo "[ i ] Fetching removal instructions..."
tar -xvf $input.tar.gz || echo "[ X ] Failed to fetch removal instructions."
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
echo "[ i ] Finished removal of $input." || echo "[ X ] Removal of $input failed."
