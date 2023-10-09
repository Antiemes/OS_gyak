#!/bin/bash

echo "Filenev?"
read fn
if [ -e $fn ]
  then
    ####  Futtathatosag
    if [ -x $fn ]
      then
        echo "A file futtathato."
      else
	echo "A file NEM futtathato."
      fi
    #### Elso sor vizsgalata
    if [ "$(head -n 1 $fn)" = "#!/bin/bash" ]
      then
        echo "Az elso sor helyes"
      else
	echo "Az elso sor NEM helyes"
      fi
    #### .sh kiterjesztes vizsgalata
    if echo $fn | grep -q '\.sh$'
      then
	echo "A kiterjesztes helyes."
      else
	echo "A kiterjesztes NEM helyes."
      fi
  else
    echo "A file nem letezik."
  fi

