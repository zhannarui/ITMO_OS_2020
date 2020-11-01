#!/bin/bash
DateTime=$(date "+%d.%m.%y_%T")
mkdir ~/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$DateTime.txt
ping www.net_nikogo.ru | echo "$DateTime Error" >> ~/report
