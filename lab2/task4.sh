#!/bin/bash
rm try4.txt
(
for pid in $(ls /proc | grep "[0-9]\+")
do
ppid=$(grep "PPid" /proc/$pid/status | awk '{print $2}')
ser=$(grep "sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
ns=$(grep "nr_switches" /proc/$pid/sched | awk '{print $3}')
art=$(awk "BEGGIN {print $ser/$ns}")
printf "ProcessID=%d : Parent_ProcessID = %d : Average_Running_Time = " $pid $ppid >> try4.txt
echo $art >> try4.txt
done
) 2> /dev/null
sort -k 7 try4.txt | tail -n +4 | sort -k 7 -n > sort4.txt
