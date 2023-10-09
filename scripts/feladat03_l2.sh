#!/bin/bash

ossz=0
nemfut=0
nemsh=0
nemelsosor=0
nemletezik=0

#echo "Filenev?"
while read fn
do
  ((ossz++))
  if [ -e $fn ]
    then
      ####  Futtathatosag
      if [ -x $fn ]
        then
          echo "A file futtathato."
        else
  	  echo "A file NEM futtathato."
	  #nemfut=$(expr $nemfut + 1)
          ((nemfut++))
        fi
      #### Elso sor vizsgalata
      if [ "$(head -n 1 $fn)" = "#!/bin/bash" ]
        then
          echo "Az elso sor helyes"
        else
  	  echo "Az elso sor NEM helyes"
	  ((nemelsosor++))
        fi
      #### .sh kiterjesztes vizsgalata
      if echo $fn | grep -q '\.sh$'
        then
  	  echo "A kiterjesztes helyes."
        else
  	  echo "A kiterjesztes NEM helyes."
	  ((nemsh++))
        fi
    else
      echo "A file nem letezik."
      ((nemletezik++))
    fi
  echo
done

echo "Statisztika:"
echo "Osszesen: $ossz"
echo "Nem futtathato: $nemfut"
echo "Nem .sh: $nemsh"
echo "Elso sor hibas: $nemelsosor"
echo "Nem letezo file: $nemletezik"
