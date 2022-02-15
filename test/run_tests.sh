#!/bin/sh

set -e

sed -i '/edge/s/^#//' /etc/apk/repositories
apk --no-cache update
apk --no-cache upgrade

cd /testfiles

export PATH

echo =========================================================================
echo '/bin/sh (dash)'
echo =========================================================================
./test.sh
echo

echo =========================================================================
echo '/bin/bash'
echo =========================================================================
apk --no-cache add bash
echo ------------------------------------------------
bash ./test.sh 'bash /usr/local/bin/json2env'
echo

echo =========================================================================
echo '/bin/mksh'
echo =========================================================================
apk --no-cache add mksh
echo ------------------------------------------------
mksh ./test.sh 'mksh /usr/local/bin/json2env'
echo

# Could not get zsh to work, some weird subshell-not-having-a-PATH thing
#echo =========================================================================
#echo '/bin/zsh'
#echo =========================================================================
#apk --no-cache add zsh
#echo ------------------------------------------------
#./test.sh 'zsh /usr/local/bin/json2env'
#echo

