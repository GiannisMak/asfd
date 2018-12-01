#!/bin/bash
declare -a myarray
let i=0
while IFS=$'\n' read -r line; do
    myarray[i]="${line}"
    ((++i))
done < $1
let i=0
while (( ${#myarray[@]} > i )); do
    echo "${myarray[i++]}"
done
echo "$i"
let i=0
echo $myarray | xargs -n 1 -P 16 wget -q
