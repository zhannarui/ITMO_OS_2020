#!/ban/bash
file=$1
vers=0
#a
case $file in 
*\ *)
echo "Your strings must be without spaces"
exit 1 
;;
esac

if [[ $# != 1 ]]
then
echo "Wrong number of input arguments"
exit 1
fi

if [[ ! -f $file ]]
then
echo "Wrong format of file"
exit 1
fi

#b
if [[ ! -d $HOME/.trash ]]
then
mkdir $HOME/.trash
fi

#c
link=$file-$vers
while [ -f $HOME/.trash/$link ]
do
let "vers = vers + 1"
link=$file-$vers
done
ln $file $HOME/.trash/$link

#d
if [[ ! -e $HOME/.trash.log ]]
then
touch $HOME/.trash.log
fi
echo $(realpath $file) $link >> $HOME/.trash.log
rm $file
