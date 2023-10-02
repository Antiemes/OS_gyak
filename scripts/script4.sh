#!/bin/bash

echo "Az elso konyvtar neve:"
read dir1
echo "A masodik konyvtar neve:"
read dir2
#dir1="/usr/bin"
egyik=$(ls -lR $dir1 | sort -n -k 5 \
 | tail -n 1 | awk '{print $5}')
echo $egyik

#dir2="/usr/lib"
masik=$(ls -lR $dir2 | sort -n -k 5 \
 | tail -n 1 | awk '{print $5}')
echo $masik
if [ $egyik -gt $masik ]
  then
    echo "A $dir1-ben levo legnagyobb file nagyobb, mint a $dir2-ben levo legnagyobb file."
  else
    echo "A $dir2-ben levo legnagyobb file nagyobb, mint a $dir1-ben levo legnagyobb file."
fi
