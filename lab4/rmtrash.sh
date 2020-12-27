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
vers=$(echo $vers"+1")
link=$file-$vers
done
ln $file $HOME/.trash/$link

#d
if [[ -z $(grep $(realpath $file) $HOME/.trash.log ]]
then
echo $(realpath $file) >> $HOME/.trash.log
fi
rm $file
