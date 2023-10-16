#!/bin/bash

ossz=0
for fn in *
do
  echo "Ezt talaltam: $fn"
  if [ -e $fn ]
    then
      echo "A file letezik."
      if [ -f $fn ]
        then
          echo "Sima file."
	  if [ "$(head -n 1 $fn)" = "#!/bin/bash" ]
	    then
	      echo "Shell script."
	      sorszam=$(cat $fn | wc -l)
	      echo "$sorszam soros."
	      ((ossz+=sorszam))
	    else
	      echo "NEM shell script."
	    fi
	else
	  echo "NEM sima file."
        fi
    else
      echo "A file NEM letezik."
    fi
  echo
done
echo "Osszesen $ossz sornyi scriptet irtunk."

