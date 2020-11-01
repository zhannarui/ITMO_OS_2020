#!/bin/bash
(
rm buff_*
for x in $(ls /proc | grep "[0-9]")
do
awk '$1 == "read_bytes:" {printf "%d ", $2}' /proc/$x/io >> buff_first.info
cmd=$(ps -e -o pid,cmd | awk -v id=$x '$1 == id {print $2}')
echo $x $cmd >> buff_first.info
done 
sleep 6
for x in $(ls /proc | grep "[0-9]")
do
awk '$1 == "read_bytes:" {printf "%d ", $2}' /proc/$x/io >> buff_second.info
echo $x >> buff_second.info
done 
while read line
do
pid=$(echo $line | awk '{print $2}')
mem=$(echo $line | awk '{print $1}')
awk -v p=$pid -v m=$mem '{
if($2 == p)
{
printf " PID %d : Cmd %s : Memory %d\n", $2, $3, m-$1
}
}' buff_first.info >> buff_third.info
done < buff_second.info 
sort -n -k 8 buff_third.info | tail -n 3
) 2> /dev/null
