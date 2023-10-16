#!/bin/bash

while read fn
do
  #echo "Irj be egy filenevet!"
  #read fn
  echo "A file neve: $fn"
  if [ -e $fn ]
    then
      echo "A file letezik."
      sorszam=$(cat $fn | wc -l)
      #wc -l $fn | awk '{print $1}'
      
      echo "A file $sorszam sorbol all."

      if [ -x $fn ]
      then
        echo "A file vegrehajthato."
      else
        echo "A file nem hajthato vegre."
      fi
    else
      echo "A file nem letezik."
  fi
  echo
done

