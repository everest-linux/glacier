#!/bin/sh
# glacier-query
# Script used to query packages on the system

echo "[ ? ] Enter package name:" && read input
cat /etc/glacier/pkginfo/$input-pkginfo.json
