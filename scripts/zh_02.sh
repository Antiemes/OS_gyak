#!/bin/bash

kt=$1
db=0
fd=0

if [ ! -d $kt ]
  then
    echo "NINCS $kt konyvtar."
    exit
  fi
shift

maxsordb=0
maxsorfn=$1
maxkardb=0
maxkarfn=$1

while [ $# -ne 0 ]
  do
    fn=$1
    shift
    ((db++))
    if [ ! -e $kt/$fn ]
      then
        echo "NINCS $kt/$fn file."
      else
	((fd++))
        wc -l $kt/$fn
        wc -c $kt/$fn
	if [ "$(head -n 1 $kt/$fn)" = "#!/bin/bash" ]
	  then
	    echo "EZZEL kezdodik."
	  else
	    echo "MASSAL kezdodik."
	  fi
	kardb=$(cat $kt/$fn | wc -c)
	sordb=$(cat $kt/$fn | wc -l)
	if [ $kardb -gt $maxkardb ]
	  then
	    maxkardb=$kardb
	    maxkarfn=$fn
	  fi
	if [ $sordb -gt $maxsordb ]
	  then
	    maxsordb=$sordb
	    maxsorfn=$fn
	  fi
      fi
    echo
  done

echo "Osszesen $db file-t adtal meg."
echo "Osszesen $fd file-t dolgoztam fel."
echo "A legtobb ($maxkardb) karaktert tartalmazo file: $maxkarfn"
echo "A legtobb ($maxsordb) sort tartalmazo file: $maxsorfn"

