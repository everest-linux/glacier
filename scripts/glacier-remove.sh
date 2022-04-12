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
echo "Checking world..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO1/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in world." 1>&2
fi
echo "Checking galaxy..." && wget https://gitub.com/everest-linux/glacier-pkgs/raw/main/$GREPO2/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in galaxy." 1>&2
fi
echo "Checking universe..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO3/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in universe." 1>&2
fi
echo "Checking multiverse..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO4/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in multiverse." 1>&2
fi
echo "Checking world-testing..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO5/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in world-testing." 1>&2
fi
echo "Checking galaxy-testing..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO6/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in galaxy-testing." 1>&2
fi
echo "Checking universe-testing..." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO7/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in universe-testing." 1>&2
fi
echo "Checking multiverse-testing.." && wget https://github.com/everest-linux/glacier-pkgs/raw/main/$GREPO8/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ i ] Not in multiverse-testing." 1>&2
fi

echo "[ i ] Unpacking $input.tar.gz..."
mkdir -v $input && mv -v $input.tar.gz $input && cd $input
tar -xvf $input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not unpack $input.tar.gz" 1>&2
    exit 1
fi
echo "[ ? ] Enter package name:" && read input
echo "[ i ] Preparing to remove $input..."
wget https://github.com/everest-linux/glacier-pkgs/raw/main/pkgs/$input.tar.gz
if [ "$?" != "0" ]; then
    echo "[ X ] Could not get archive for $input." 1>&2
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
