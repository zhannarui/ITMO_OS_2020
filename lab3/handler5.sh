#!/bin/bash
command="+"
answer=1
(tail -f pipe5) |
while true 
do
    read line
    case $line in 
              "+")
                   command="+"
                   echo "Adding numbers"
;;
             "m")
                 command="*"
                 echo "Multiplying numbers"
;;
          [0-9]*)
                 if [[ $command == "+" ]]
                          then
                      let answer=$answer+$line
                          else
                      let answer=$answer+$line
                 fi
            echo "$answer"
;;
         "QUIT")
                 killall tail
                 echo "planed stop"
                 exit 0
;;
             *)
             killall tail
             echo "input data error"
             exit 1
;;
esac
done
            
