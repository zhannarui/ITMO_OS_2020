!#/bin/bash
maxSize=0
pid=0
for x in $(ls /proc | grep "[0-9]")
do
tMem=$(awk '$1 == "VmSize:" {print $2}' /proc/$x/status)
tPid=$$(awk '$1 == "Pid:" {print $2}' /proc/$x/status)
if [[ "$tMem -gt "$maxSize" ]];
then
maxSize=$tMem
pid=$tPid
fi
done
echo "Max: $pid"
top -b -o +Virt | head -n 8 | tail -n 2
) 2> /dev/null
