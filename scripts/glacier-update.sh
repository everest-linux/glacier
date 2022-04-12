#!/bin/sh
# glacier-update
# Script used to update packages

# Script messes shit up if you don't run as root so thats why this is here
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
echo "[ i ] Unpacking $input.tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi

rm /var/log/glacier/$input.timestamp
echo "[ i ] Unpacking $input,tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz 
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
chmod +x UPDATE.sh
chmod +x $input.ts.sh
./UPDATE.sh
./$input.ts.sh
echo "[ i ] Cleaning up..."
mv -v $input-pkginfo.json /etc/glacier/pkginfo
mv $input.timestamp /var/log/glacier
cd ..
rm -rvf $input
echo "[ i ] Operation completed."
