prev_backup=$(ls /home/user | grep -E "^Backup-????-??-??" | sort -n -r | head -1 )
if [ ! -z /home/user/$prev_backup ]
then
	for file in $(ls /home/user/$prev_backup | grep -E -v "*.[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]")
	do
		cp /home/user/$prev_backup/$file /home/user/restore
	done
fi
