#!/bin/bash
echo "enter your table name plz"
read name
if [[ -f ~/DBData/$1/$name ]]
then
echo "this table name alredy exist"
else
touch ~/DBData/$1/$name
echo "if you finished entering data press esc"
while true;
do
echo "enter your coulmns name plz"
read -a arr
if [[ ${arr[@]} = $'\033' ]]
then
break 
else
for i in ${arr[@]}
do
if grep -Fq "$i" ~/DBData/$1/$name
then
echo "this coloumn is already exist"
else
echo "enter the Data Type plz"
read -a arr2
for j in ${arr2[@]}
do
if [ $j = string -o $j = int ]
then
printf "$i|" >> ~/DBData/$1/$name
else
echo "not valid data type"
fi
done
fi
done
fi
done
echo "is there is primary key ??"
read answer
if [[ $answer = [yY]* ]]
then
echo "enter the name of primary key"
read answer2
if grep -Fq "$answer2" ~/DBData/$1/$name
then
result1=$answer2
result="*"$result1
#echo $answer2
#echo $result1
#echo $result
sed -i -n "s/$result1/$result/gp" ~/DBData/$1/$name >>~/DBData/$1/$name
 else
 printf "*""$answer2" >> ~/DBData/$1/$name
echo "enter the data type "
read ans
fi
fi
fi
