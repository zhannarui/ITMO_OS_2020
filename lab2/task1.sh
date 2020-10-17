#!/bin/bash
ps -u | sed 1d | wc -l > try1.txt
ps -u |sed 1d | awk '{print $2 ": " $11}' >> try1.txt
