#!/bin/bash
echo "   *----------------------------*"
COLUMNS=12
select opt in "|      Create Table 1        |" "|      List Tables 2         |" "|      Drop Tables 3         |" "|      Insert into Table 4   |" "|      Select From Table 5   |" "|      Delete From Table 6   |" "|      Update Table 7        |" "|      Exit 8                |" "*----------------------------*"
do
case $opt in
"|      Create Table 1        |")source createTable.sh ;;
"|      List Tables 2         |")source lsTable.sh ;; 
"|      Drop Tables 3         |")source droptable.sh ;;
"|      Insert into Table 4   |")source insertTable.sh ;;
"|      Select From Table 5   |")source select2.sh ;;
"|      Delete From Table 6   |")source deleteTable.sh ;;
"|      Update Table 7        |")source updateTable.sh ;;
"|      Exit 8                |") exit ;;
"*----------------------------*")echo -e "\e[31mNot Valid Chooice\e[0m" ;;
*) echo -e "\e[31mNot Valid Chooice\e[0m" ;;
esac
done
