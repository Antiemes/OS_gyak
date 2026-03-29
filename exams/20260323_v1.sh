#!/bin/bash

fn="$1"

if [ ! -e "${fn}" ]
then
  echo "A ${fn} nem letezik."
  exit 1
fi

echo "Ev:"
read ev
if echo "${ev}" | grep -qEv '^[0-9]{4}$'
then
  echo "Az ev nem jo."
  exit 1
fi

echo "Honap:"
read honap
if echo "${honap}" | grep -qEv '^[0-9]{2}$'
then
  echo "A honap nem jo."
  exit 1
fi

echo "Nap:"
read nap
if echo "${nap}" | grep -qEv '^[0-9]{2}'
then
  echo "A nap nem jo."
  exit 1
fi

if grep -q "^${ev}_${honap}${nap}" "${fn}"
then
  echo "igen"
else
  echo "nem"
fi
