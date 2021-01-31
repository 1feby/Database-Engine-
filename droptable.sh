#!/bin/bash
echo " enter the table name"
read name;
if [[ $name == "" ]]
then
echo "you didn't enter name please try again"
else
if [[ ! -f ~/DBData/$1/$name ]]
then
echo "there is no table called $name"
else
echo " are you sure you want to delete $name [y/n]"
read answer
if [[ $answer = [yY]* ]]
then
rm -r ~/DBData/$1/$name
rm -r ~/DBData/$1/"$name"+"p"
echo "Done"
fi
fi
fi
