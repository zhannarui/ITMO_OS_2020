#!/bin/bash
> try5.txt
ppid=-1
count=0
art=0
(
while read line 
do
ppid_temp=$(echo "$line" | awk -F "[=:]" '{print $4}')
art_temp=$(echo "$line" | awk -F "[=:]" '{print $6}')
if [[ $ppid != $ppid_temp && $ppid != -1 ]];
then 
relativ=$(echo "scale7;$art/$count" | bc)
echo "Average_Sleeping_Children_of_Parent=$ppid is $relativ" >> try5.txt
count=0
art=0
fi
ppid=$ppid_temp
art=$(echo "scale=7;$art+$art_temp" | bc)
(( count++ ))
echo $line >> try5.txt
done < sort4.txt
relativ=$(echo "scale=7;$art/$count" | bc)
echo "Average_Sleeping_Children_of_Parent=$ppid is $relativ" >> try5.txt
) 2> /dev/null
