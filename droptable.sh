#!/bin/bash
echo " enter the table name"
read name;
if [[ $name == "" ]]
then
echo -e "\e[31myou didn't enter name please try again\e[0m"
else
if [[ ! -f ~/DBData/$1/$name ]]
then
echo -e "\e[31mthere is no table called $name\e[0m"
else
echo -e  "\e[34m are you sure you want to delete $name [y/n]\e[0m"
read answer
if [[ $answer = [yY]* ]]
then
rm -r ~/DBData/$1/$name
rm -r ~/DBData/$1/"$name"+"p"
echo -e "\e[32mDone\e[0m"
fi
fi
fi
