#!/bin/bash
echo "plz enter the data base you want to connect to"
read answer
if [[ $answer == "" ]]
then
echo "You didn't enter name please try again"
else
if [ ! -d ~/DBData/$answer ]
then
echo "there is no database called $answer"
else
chmod +x submenu.sh
gnome-terminal -e "./submenu.sh $answer" >>/dev/null
fi
fi
