#!/bin/bash

if [ $# -eq 0 ]
  then
    $0 .
  fi

while [ $# -ne 0 ]
  do
  ktar=$1
  shift

  find $ktar -type f \
    | while read fn
        do
          echo $fn
  	hossz=$(ls -l $fn | awk '{print $5}')
  	if [ $hossz -eq 0 ]
  	  then
  	    echo "  Nulla hossz"
  	  fi
  	shveg=0
  	xjog=0
  	esorjo=0
  	if echo $fn | grep -q '\.sh$'
  	  then
  	    shveg=1
  	  fi
  	if [ -x $fn ]
  	  then
  	    xjog=1
  	  fi
  	esor=$(head -n 1 $fn)
  	if [ "$esor" = "#!/bin/bash" ]
  	  then
  	    esorjo=1
  	  fi
  	if [ $esorjo -eq 0 ]
  	  then
  	    echo "  Elso sor nem OK"
  	  fi
  	if [ $xjog -eq 0 ] && [ $shveg -eq 1 ]
  	  then
  	    echo "  Futasi jog nelkuli script"
  	  fi
  	if [ $shveg -eq 0 ] && [ $xjog -eq 1 ] && [ $esorjo -eq 1 ]
  	  then
  	    echo "  .sh kiterjesztes hianyzik"
  	  fi
	  enr=$(ls -l $fn | cut -c 2)
	  enw=$(ls -l $fn | cut -c 3)
	  enx=$(ls -l $fn | cut -c 4)
	  grr=$(ls -l $fn | cut -c 5)
	  grw=$(ls -l $fn | cut -c 6)
	  grx=$(ls -l $fn | cut -c 7)
	  otr=$(ls -l $fn | cut -c 8)
	  otw=$(ls -l $fn | cut -c 9)
	  otx=$(ls -l $fn | cut -c 10)
	  if [ $enr = "-" ] && ([ $grr = "r" ] || [ $otr = "r" ] )
	    then
	      echo "  Mas olvashatja, a tulaj nem"
	    fi
	  if [ $enw = "-" ] && ([ $grw = "w" ] || [ $otw = "w" ] )
	    then
	      echo "  Mas irhatja, a tulaj nem"
	    fi
	  if [ $enx = "-" ] && ([ $grx = "x" ] || [ $otx = "x" ] )
	    then
	      echo "  Mas futtathatja, a tulaj nem"
	    fi
        done
done
