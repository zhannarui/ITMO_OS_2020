#!/bin/bash
rm try4.txt
for pid in $(ls proc | grep "[0-9]\+")
do
ppid=$(grep "PPid" /proc/$pid/status 2>/dev/null | awk '{print $2}')
ser=$(grep "sum_exec_runtime" /proc/$pid/sched 2>/dev/null | awk '{print $3}')
ns=$(grep "nr_switches" /proc/$pid/sched 2>/dev/null | awk '{print $3}')
art=$(awk "BEGGIN {print $ser/$ns}" 2>/dev/null)
printf "ProcessID=%d : Parent_ProcessID=%d : Average_Running_Time=" $pid $ppid >> try4.txt
echo $art >> try4.txt
done
sort -k3 try4.txt > sort4.txt
