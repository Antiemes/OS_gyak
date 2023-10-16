#!/bin/bash

for nk in rnplv0 antiemes dfghdfgh
  do
    echo -n $nk | tr '[a-z]' '[A-Z]'
    if w | grep -q "^$nk "
      then
        echo " be van lepve."
      else
        echo -n " nincs belepve"
        if last | grep -q "^$nk "
          then
            echo ", de be volt lepve regebben."
          else
            echo " es nem is volt soha belepve."
          fi
      fi
  done

