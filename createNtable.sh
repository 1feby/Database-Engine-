#!/bin/bash
declare pr;
pr=0;
echo "enter your table name plz"
read name
if [[ -f ~/DBData/$1/$name ]]
then
echo "this table name alredy exist"
else
touch ~/DBData/$1/$name
touch ~/DBData/$1/$name+"p"
echo "if you finished entering data press esc"
while true;
do
echo "enter your coulmns name plz"
read -a arr
if [[ ${arr[@]} = $'\033' ]]
then
break 
else
for i in ${arr[@]}
do
if grep -Fq "$i|" ~/DBData/$1/$name
then
echo "this coloumn is already exist"
else
COULMN 12 2>/dev/null
select opt in "string 1" "int 2"
do
case $opt in
"string 1") printf "string|" >> ~/DBData/$1/$name+"p" ;break ;;
"int 2")  printf "int|" >> ~/DBData/$1/$name+"p"; break ;;
*) echo "not valid choice" ;;
esac
done
if (( $pr == 0 ))
then
COULMN 12 2>/dev/null
select op in "primary key 1" "value 2"
do
case $op in
"primary key 1" ) printf ""*"$i|" >> ~/DBData/$1/$name ;pr=1;break ;;
"value 2") printf "$i|" >> ~/DBData/$1/$name ;break ;;
*) echo "not valid"; break ;;
esac
done
else
printf "$i|" >> ~/DBData/$1/$name
fi
fi
done
fi
done
fi
#echo >> ~DBData/$1/$name
