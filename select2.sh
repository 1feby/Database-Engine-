#!/bin/bash
echo "Enter the table name you want to select from "
read name;exist=0
count=0;
if [[ $name == "" ]]
then
echo " you didn't enter the name please try again"
else
if [[ ! -f ~/DBData/$1/$name ]]
then
echo "there is no table called $name"
else 
if [[ -z ~/DBData/$1/$name ]]
then
echo "It is an empty file"
else
colNameArr=$(sed -n '1p' ~/DBData/$1/$name | awk '-F|' '{for(i=1;i<NF;i++)  print $i }');
selectSpec(){
        echo "enter the column name" ; read col ;
        i=1       
        if [[ $col == "" ]]
then 
echo " You didn't enter the name please try again"
count=1;
else
     for colName in $colNameArr
        do
if [[ $colName == "*"* ]]
then
      colName=$(echo $colName | sed 's/*//')
fi
        if [[ "$colName" == "$col" ]]
        then 
          exist=1;selectedCol=$i
        fi
         i=$((i + 1))

        done
fi
}

select opt in "select all 1" "select specific coloumn 2" "select from table under condition 3" "Exit 4"
do
case $opt in
#"select all 1") cat ~/DBData/$1/$name;;
"select all 1") cat ~/DBData/$1/$name;;

"select specific coloumn 2") selectSpec;
if [[ $count == 1 ]]
then
break
else
if [[ $exist -eq 1 ]]
then
ColumnRecords=$(cut -d '|' -f $selectedCol  ~/DBData/$1/$name | awk  '{if(NR>1) print $0}' )
for c in $ColumnRecords
do
echo $c
done
else
echo "not exist value"
fi
fi
;;
"select from table under condition 3")source selecte.sh ;;
"Exit 4") break;;
*) echo "not valid";;
esac 
done
fi
fi
fi
