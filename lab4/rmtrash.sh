#!/ban/bash
script1=$1

#a
case $script1 in 
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

if [[ ! -f $script1 ]]
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
link=$(date + "%T")
ln $script1 $HOME/.trash/$link
rm $script1

#d
if [[ ! -e $HOME/.trash.log ]]
then
touch $HOME/.trash.log
fi
echo "$PWD/$script1 : $link" > $HOME/.trash.log
