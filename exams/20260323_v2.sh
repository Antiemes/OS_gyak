#!/bin/bash

datum="$1"
shift

while [ $# -ne 0 ]
do
fn="$1"
shift

echo "${fn} vizsgalata:"

if [ ! -e "${fn}" ]
then
  echo "A ${fn} nem letezik."
  continue
fi

if grep -q "^${datum}" "${fn}"
then
  echo "igen"
  grep "^${datum}" "${fn}" \
 | sed 's/^[^,]*,//'\
 | sed 's/,.*$//'\
 | sort -u | wc -l

  echo "Legkisebb jelerosseg:"
  grep "^${datum}" "${fn}" | cut -d, -f3 \
 | sort -un | head -n 1
  echo "Legnagyobb jelerosseg:"
  grep "^${datum}" "${fn}" | cut -d, -f3 \
 | sort -un | tail -n 1

else
  echo "nem"
fi

echo

done