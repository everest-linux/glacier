#!/bin/sh
# glacier-update
# Script used to update packages

# Script messes shit up if you don't run as root so thats why this is here
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier as root."
    exit
fi

echo "[ ? ] Enter package name:" && read input
echo "[ i ] Downloading $input.tar.gz..."
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not get archive for $input." 1>&2
    exit 1
fi
echo "[ i ] Unpacking $input,tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz 
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
chmod +x UPDATE.sh
./UPDATE.sh
echo "[ i ] Cleaning up..."
mv -v $input-pkginfo.json /etc/glacier/pkginfo
cd ..
rm -rvf $input
echo "[ i ] Operation completed."
