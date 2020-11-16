#!/bin/bash
while true
do
      read line
      case $line in
      "TERM")
             kill -SIGTERM $(cat pipe6)
             exit
      ;;
      "+")
            kill -USR1 $(cat pipe6)
      ;;
      "*")
           kill -USR2 $(cat pipe6)
      ;;
      esac
done
