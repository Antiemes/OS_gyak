#!/bin/bash

while read fn
do
  #echo "Kerek egy file-nevet"
  if [ -e $fn ]
    then
      echo "A file neve: $fn"
      echo -n "A file sorainak szama:"
      #wc -l $fn | awk '{print $1}'
      cat $fn | wc -l
      if [ -x $fn ]
        then
          echo "A file vegrehajthato."
        else
          echo "A file nem vegrehajthato."
      fi
      echo
    else
      echo "A $fn nem letezik."
  fi
done

