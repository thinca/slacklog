#!/usr/bin/env bash

function f(){
  typeset n=$1
  for y in $(seq 0 $(($n ** 2)));
  do
    for x in $(seq 0 $(($n ** 2)));
    do
      if [[ $(((($n - $x) ** 2) + (($n - $y) ** 2))) -le $(($n ** 2)) ]];then
        echo "■\c"
      else
        echo "□\c"
      fi
    done
    echo ""
  done
}

f 3