#!/bin/bash
echo "Enter the table name please"
read name
if [[ $name == "" ]]
then
echo "You didn't enter the name please try again"
else
if  [[ ! -f ~/DBData/$1/$name ]] 
then
echo " There is no tabels called $name"
else
echo " choose what do you want to delete "
COULMN=12
select opt in "Delete all table 1" "Delete scpecific coulmn 2" "exit 3"
do
case $opt in
"Delete all table 1" )awk -i inplace 'NR == 1 { print $1 }' ~/DBData/$1/$name ;echo "done" ;;
"Delete scpecific coulmn 2")source deleteCoulmn.sh ;;
"exit 3") break;;
*) echo "Not valid chooise" ;;
esac
done
fi
fi

