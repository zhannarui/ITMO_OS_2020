#!/bin/bash

./try4.sh & FirstPidID=$!
./try4.sh & SecondPidID=$!
./try4.sh & ThirdPidID=$!

echo "First process" $FirstPidID
echo "Second process" $SecondPidID
echo "Third process" $ThirdPidID

renice +10 -p $FirstPidID
kill $ThirdPidID
