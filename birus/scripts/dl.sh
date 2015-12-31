#!/bin/bash

if [ $# -eq 0 ]; then
  echo "usage: dl.sh <url> [output]"
  exit 0
fi

progressfilt() {
  local flag=false c count cr=$'\r' nl=$'\n'
  while IFS='' read -d '' -rn 1 c ; do
    if $flag ; then
        printf '%c' "$c"
    else
      if [[ $c != $cr && $c != $nl ]]; then
        count=0
      else
        ((count++))
        if ((count > 1)) ; then
          flag=true
        fi
      fi
    fi
  done
}

url=$1
output=$2

if [ "$output" = "" ]; then
  output=$(basename $1)
fi

wget --progress=bar:force -O $output $url 2>&1 | progressfilt
