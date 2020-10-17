#!/bin/bash
ps -e -o pid,command | grep -E "/sbin" | awk '{print "PID" " " $1}' > try2.txt
