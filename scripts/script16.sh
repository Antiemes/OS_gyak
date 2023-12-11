#!/bin/bash

find . -type f -name "*.sh" | \
  while read fn
    do
      echo "   "$fn
      flag=0
      if grep -q "for" $fn
	then
	  echo "FOR-os script."
	  flag=1
	fi
      if grep -q "if" $fn
	then
	  echo "IF-es script."
	  flag=1
	fi
      if grep -q "while" $fn
	then
	  echo "WHILE-os script."
	  flag=1
	fi
      if [ $flag -eq 0 ]
	then
	  echo "Semmi extra."
	fi
      echo
    done


