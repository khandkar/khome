#! /bin/sh

while read line
do
    echo "$(date +'%F %T') ==> $line"
done
