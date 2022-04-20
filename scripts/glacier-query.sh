#!/bin/sh
# glacier-query
# Script used to query packages on the system

printf "\033[1;34m [ ? ] \033[m Enter package name: " && read input
cat /etc/glacier/pkginfo/$input-pkginfo.json
cat /var/log/glacier/$input.timestamp
if [ "$?" != "0" ]; then
    printf "\033[1;31m [ $error ] \033[m Package not found. " 1>&2
    exit 1
fi
