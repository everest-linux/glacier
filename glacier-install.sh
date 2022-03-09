#!/bin/sh
# glacier-install
# Script used to fetch installation scripts and run them

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Downloading source tarball for $input..."
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
echo "[ i ] Unpacking $input.tar.gz..."
tar -xvf $input.tar.gz
cd $input
chmod +x INSTALL.sh
./INSTALL.sh
rm $input.tar.gz
echo "Done."
