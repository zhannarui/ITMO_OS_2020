#!/bin/bash

echo $$ > pipe6 

num=1
command="+"

sigterm()
{
     echo "exit"
     exit
}

user1()
{
     command="+"
}

user2()
{
     command="*"
}

trap 'sigterm' SIGTERM
trap 'user1' USR1
trap 'user2' USR2

while true
do 
      case $command in 
      "+")
          let num=$num+2
          echo $num
      ;;
      "*")
          let num=$num*2
          echo $num
      ;;
      esac
sleep 2
done
      
