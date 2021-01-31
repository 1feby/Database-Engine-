#!/bin/bash
clear
echo -e "          *\e[5mwelcome to DBEngine\e[0m*                   "
echo "          ======================                   "  
echo -e "    *\e[1mchoose what you want to do\e[0m* "
echo "   *----------------------------*"

COLUMNS=12
select opt in "|    Create Database 1       |" "|    List Database 2         |" "|    Connect To Database 3   |" "|    Drop Database 4         |" "|    Exit 5                  |"  "*----------------------------*"
do

case $opt in
"|    Create Database 1       |")source createDB.sh ;;
"|    List Database 2         |")source ls.sh ;;
"|    Connect To Database 3   |")source connectDB.sh ;;
"|    Drop Database 4         |")source drop.sh ;;
"|    Exit 5                  |") exit;;
"*----------------------------*") echo -e "\e[31mNot Valid Choice\e[0m";;
*) echo -e "\e[31mNot Valid Choice\e[0m";;
esac
done


