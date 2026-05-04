#!/bin/bash

dname="$1"

if [ $# -eq 0 ]
then
  echo "Nincs megadva parameter: a /tmp/txt-ben dolgozom."
  dname="/tmp/txt"
fi

if [ $# -gt 1 ]
then
  echo "Tul sok parameter van megvadva."
  exit 1
fi

if [ ! -d "${dname}" ]
then
  echo "Nem konyvtarnev van megadva!"
  exit 1
fi

if [ "$(ls "${dname}" | wc -l)" -eq 0 ]
then
  echo "A megadott konyvtar ures!"
  exit 1
fi

echo "Minden OK."

for fn in ${dname}/*
do
  echo "Vizsgalt file: ${fn}"
  if basename "${fn}" | grep -qv '^[0-9]\+\.txt$'
  then
    echo "   Rossz filenev formatum."
    continue
  fi
  if grep -qvE '^# *[0-9]+, [0-9]+.[0-9]+ \([0-9]+\)$' "${fn}"
  then
    echo "   Hibas sorok a file-ban."
    continue
  fi
  echo -n "   Legkisebb ertek: "
  sort -n -k 3 "${fn}" | head -n 1 | sed 's/^.*, //' | sed 's/ .*//'
  echo -n "   Legnagyobb ertek: "
  sort -n -k 3 -r "${fn}" | head -n 1 | sed 's/^.*, //' | sed 's/ .*//'

  #echo "Kulonbozo ertekek a 3. oszlopban:"
  #             cat "${fn}" | sed 's/^.*(\([0-9]*\)).*$/\1/' | sort -n -u | wc -l
  #for n in $(cat "${fn}" | sed 's/^.*(\([0-9]*\)).*$/\1/' | sort -n -u)
  #do
  #    echo -n "${n}: "
  #    grep "(${n})" "${fn}" | wc -l
  #done
  i=0
  head -n 100 "${fn}" | sed 's/^# *//' | sed 's/,.*//' \
  | while read x
    do
      #echo $x $i
      if [ "${x}" -ne "${i}" ]
      then
          echo "   Sorszam nem jo!"
          break
      fi
      ((i += 1))
    done
done
