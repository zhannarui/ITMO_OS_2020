#!/bin/bash
numbers=()
counter=0
while true
do
numbers+=(1 2 3 4 5 6 7 8 9 10)
let counter++
if [[ "${#numbers[@]}" -ge "$1" ]]
then
exit 0
fi
done
