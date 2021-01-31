#!/bin/bash
echo enter the database name you want to delete
read name
if [[ $name == "" ]]
then
echo -e "\e[31mYou didn't enter the name please try again\e[0m "
else
if [ ! -d ~/DBData/$name ]
then
echo -e "\e[31mthere is no database called $name\e[0m"
else
echo -e "\e[34mare you sure you want to delete the DB(y/n)?\e[0m"
read answer
if [[ $answer = [yY]* ]]
then
rm -r ~/DBData/$name
echo -e "\e[32mDone\e[0m"
fi
fi
fi
