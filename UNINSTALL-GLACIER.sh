#!/bin/sh

# Require the script to be run as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "[ X ] Please run Glacier uninstallation as root."
    exit
fi

echo "[ ! ] It is recommended to uninstall all Glacier packages before uninstalling Glacier."
echo "[ ! ] This will prevent untracked packages from remaining on your system and possibly creating a security risk."
echo "[ ! ] To see which packages are installed on your system, run the following command:"
echo "[ ! ] ls /etc/glacier/pkginfo"
while true; do
    read -p "[ ? ] Would you like to uninstall Glacier?" yn
    case $yn in
        [Yy]* ) rm -rf /etc/glacier && rm /bin/glacier-install && rm /bin/glacier-update && rm /bin/glacier-remove && rm /bin/glacier-query && rm /bin/glacier-help; break;;
        [Nn]* ) exit;;
        * ) echo "[ ! ] You must answer either yes or no.";;
    esac
done
