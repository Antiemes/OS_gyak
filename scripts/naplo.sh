#!/bin/bash

grep ':/bin/bash$' /etc/passwd | tr '[: ]' '[ _]' \
  | awk '{print $1 " " $5}' \
  | tr -d '[,]' \
  | while read nk nev
    do
      if last | grep -q "^$nk "
        then
	  #echo "Belepett."
	  true
	else
          echo "NK: $nk"
          echo "NEV: $nev"
	  echo "Nem lepett be."
          echo
	fi
    done # | grep '^Nem lepett be.$' | wc -l

