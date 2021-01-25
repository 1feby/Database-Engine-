#!/bin/bash
echo "enter your table name plz"
read name
if [[ -f ~/DBData/$1/$name ]]
then
echo "this table name alredy exist"
else
touch ~/DBData/$1/$name
#echo "     $name    " >> ~/DBData/$1/$name
echo "enter your coulmns name plz"
read -a arr
for i in ${arr[@]}
do
printf "$i|"  >> ~/DBData/$1/$name
done
fi
