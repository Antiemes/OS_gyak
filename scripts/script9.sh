#!/bin/bash

while read fn
  do
    echo "A megadott file: $fn"
    if [ -e $fn ]
      then
        echo "A file letezik."
	if [ -x $fn ]
	  then
	    echo "A file futtathato."
	  else
	    echo "A file nem futtathato."
	fi
      else
        echo "A file nem letezik."
    fi
    echo
  done
