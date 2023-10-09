#!/bin/bash

echo "A futtathatok helye?"
read celf
echo "A NEM futtathatok helye?"
read celnf

echo "Fajl neve?"
read fn

echo "Bekert adatok:"
echo "celf: $celf"
echo "celnf: $celnf"
echo "fn: $fn"

if [ -e $fn ]
  then
    if [ -x $fn ]
      then
	echo "$fn futtathato --> $celf"
	cp $fn $celf
      else
        echo "$fn NEM futtathato --> $celnf"
	cp $fn $celnf
      fi
  else
    echo "A $fn nem letezik."
  fi

