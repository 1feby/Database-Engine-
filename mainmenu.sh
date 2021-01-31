#!/bin/bash
clear
echo "           *welcome to DBEngine*                   "
echo "          =====================                   "  
echo "    *choose what you want to do* "
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
"*----------------------------*") echo "Not Valid Choice";;

*) echo "Not Valid Choice";;
esac
done


