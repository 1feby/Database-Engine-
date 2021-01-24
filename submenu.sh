#!/bin/bash
select opt in "Create Table 1" "List Tables 2" "Drop Tables 3" "Insert into Table 4" "Select From Table 5" "Delete From Table 6" "Update Table 7" "Exit 8"
do
case $opt in
"Create Table 1")source createTable.sh ;;
"List Tables 2")source lsTable.sh ;; 
"Drop Tables 3") ;;
"Insert into Table 4") ;;
"Select From Table 5") ;;
"Delete From Table 6") ;;
"Update Table 7") ;;
"Exit 8") exit ;;
*) echo "Not Valid Chooice" ;;
esac
done
