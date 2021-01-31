#!/bin/bash
echo enter the database name you want to delete
read name
if [[ $name == "" ]]
then
echo "You didn't enter the name please try again "
else
if [ ! -d ~/DBData/$name ]
then
echo "there is no database called $name"
else
echo "are you sure you want to delete the DB(y/n)?"
read answer
if [[ $answer = [yY]* ]]
then
rm -r ~/DBData/$name
echo "Done"
fi
fi
fi
