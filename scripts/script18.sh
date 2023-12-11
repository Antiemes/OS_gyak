#!/bin/bash

for kulcsszo in "fn" "if" "else" "done" "wc" "ls" "fi"
  do
    echo -n $kulcsszo" "
    find . -name "*.sh" -exec sh -c "if grep -q $kulcsszo \"{}\" ; then echo \"{}\" ; fi" \; | wc -l
  done | sort -k 2 -n | tail -n 1
