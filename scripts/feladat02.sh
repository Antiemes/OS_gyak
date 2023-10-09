#!/bin/bash

read celf
read celnf
if [ ! -d $celf ]
  then
    echo "$celf letrehozasa"
    mkdir $celf
  fi

if [ ! -d $celnf ]
  then
    echo "$celnf letrehozasa"
    mkdir $celnf
  fi

while read fn
  do
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
   done 
