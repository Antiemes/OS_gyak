#!/bin/bash

while [ $# -ne 0 ]
  do
    fn=$1
    shift
    if [ ! -e $fn ]
      then
	true
	#echo "Hianyzo file: $fn"
      else
        wc -c $fn
      fi
  done | sort -n -k 1 | head -n 1
