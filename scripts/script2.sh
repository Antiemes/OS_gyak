#!/bin/bash

while read konyvtar
do
#echo "Hol keressem a leghosszabb file-t?"
echo "A leghosszabb file a "$konyvtar"-ban"
ls -lR $konyvtar 2> /dev/null \
 | sort -n -k 5 | tail -n 1 \
 | awk '{print $9 " "  $5}'
echo
done

