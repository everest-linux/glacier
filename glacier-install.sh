#!/bin/sh
# glacier-install
# Script used to fetch installation scripts and run them

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Downloading source tarball for $input..."
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz || echo "[ X ] Failed to get archive for $input."
echo "[ i ] Unpacking $input.tar.gz..."
tar -xvf $input.tar.gz || echo "[ X ] Failed to unpack archive for $input."
cd $input
chmod +x INSTALL.sh
./INSTALL.sh # Actually executes installation script
echo "[ i ] Cleaning up..." # Status message
rm $input.tar.gz # Cleans up installation files
echo "[ i ] Finished installation of $input." || echo "[ X ] Installation of $input failed." # Indicates success || Indicates failure
