#!/bin/bash

celf="futtathato"
celnf="nemf"
echo "Fajl neve?"
read fn
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

