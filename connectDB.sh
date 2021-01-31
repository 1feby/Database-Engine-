#!/bin/bash
echo "plz enter the data base you want to connect to"
read answer
if [ ! -d ~/DBData/$answer ]
then
echo -e "\e[31mthere is no database called $answer\e[0m"

else
chmod +x submenu.sh
gnome-terminal -e "./submenu.sh $answer" >>/dev/null
fi
