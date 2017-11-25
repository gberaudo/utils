#!/bin/bash

# Call script from /var/www/beraudo

echo $1


if [ -d "$1" ]
then
  echo "Directory"

elif [ -f "$1" ]
then
  echo "File"

else
  echo "A file or directory is required"
  exit 1
fi

R=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
if [[ ${1:0:1} == "/" ]]
then
  echo "Absolute file"
  TO=$1
else
  echo "Relative file"
  TO=`pwd`/$1
fi

FROM="shares/${R}_`basename $1`"
echo " -> $TO : https://beraudo.net/$FROM"

ln -s $TO $FROM
