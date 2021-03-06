prev_backup=$(ls /home/user | grep -E "^Backup-????-??-??" | sort -n -r | head -1 )
dir_made=0
new_backup=/home/user/Backup-$(date +"%F")
backup_update=0
if [ ! -d /home/user/source ]
then
echo "Source doesn't exist"
fi
#a
if [ -z $prev_backup ]
then
	mkdir $new_backup && dir_made=1
else
	if (( $(echo "($(date -d $(date +'%F') +'%s') - $(date -d ${prev_backup:7} +'%s')) / 86400" | bc) > 7 ))
	then
		mkdir $new_backup && dir_made=1
	else
		echo "Directory is already exist"
	fi
fi
#b
if (( $dir_made == 1 ))
then
	cp /home/user/source/* $new_backup
	echo "New backup created: Backup-"$(date +"%F")" "$(date +"%T")" "$(ls /home/user/source/*) >> /home/user/backup-report
#c
else
	changed_files="Changed files:\n"
	new_files="New Files:\n"
	for file in $(ls /home/user/source)
	do
		if [ -f /home/user/$prev_backup/$file ]
		then
			if [[ $(stat -c "%s" /home/user/$prev_backup/$file) -ne $(stat -c "%s" /home/user/source/$file) ]]
			then
				backup_update=1
				mv /home/user/$prev_backup/$file /home/user/$prev_backup/$file.$(date +"%F")
				cp /home/user/source/$file /home/user/$prev_backup
				changed_files=$changed_files""$file" "$file.$(date +"%F")"\n"
			fi
		else
			backup_update=1
			cp /home/user/source/$file /home/user/$prev_backup
			new_files=$new_files""$file"\n"
		fi
	done
	if (( $backup_update == 1 ))
	then
		echo -e "Backup updated: "${prev_backup:7}" "$(date +"%T")"\n"$new_files"---\n"$changed_files"---\n" >> /home/user/backup-report
	fi
fi
