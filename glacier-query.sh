#!/bin/sh
# glacier-query
# Script used to query packages on the system

echo "[ ? ] Enter package name:" && read input
cat /etc/glacier/pkginfo/$input-pkginfo.json
if [ "$?" != "0" ]; then
    echo "[ X ] Package $input not found!" 1>&2
    exit 1
fi
