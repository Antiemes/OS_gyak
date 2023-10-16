#!/bin/bash

#dir1="/usr/bin"
echo "Az elso konyvtar neve:"
read dir1
meret1=$(ls -lR $dir1 | sort -n -k 5 \
  | tail -n 1 | awk '{print $5}')
echo "A $dir1-ben levo legnagyobb file merete: $meret1"

#dir2="/usr/lib"
echo "A masodik konyvtar neve:"
read dir2
meret2=$(ls -lR $dir2 | sort -n -k 5 \
  | tail -n 1 | awk '{print $5}')
echo "A $dir2-ben levo legnagyobb file merete: $meret2"

if [ $meret1 -eq $meret2 ]
  then
    echo "A ket file merete egyenlo."
elif [ $meret1 -gt $meret2 ]
  then
    echo "A $dir1-ben levo legnagyobb file a nagyobb."
  else
    echo "A $dir2-ben levo legnagyobb file a nagyobb."
fi
