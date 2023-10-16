#!/bin/bash

while read konyvtar
do
  echo "A leghosszabb file keresese a" ${konyvtar} "ban"
  ls -lR "$konyvtar" 2> /dev/null | sort -n -k 5 \
   | tail -n 1 \
   | awk '{print $9 " " $5}'
done
