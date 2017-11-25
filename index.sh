#!/bin/bash

SHARES="shares"
echo $1


if [ ! -d "$1" ]
then
  echo "A directory is required"
  exit 1
fi

# if [ -e "$1/index.html" ]
# then
#   echo "An index already exists"
#   exit 1
# fi

cd $1
echo > index.html <<EOF

EOF
for file in `ls`
do
  FILE=`file $file`
  if echo $FILE | grep -q JPEG
  then
    echo "<a href=\"$file\">$file</a>" >> index.html
  elif echo $FILE | grep -q Media
  then
    echo '<video width="960" height="540" controls><source src="'$file'">Your browser does not support the video tag.</video>' >> index.html
  else
    echo "Skipping unknown $file $FILE"
  fi
done
