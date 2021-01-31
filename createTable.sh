#!/bin/bash
declare pr;
pr=0;
echo "enter your table name plz"
read name
if [[ $name == "" ]]
then
echo -e "\e[31mYou didn't enter name please try again\e[0m "
else
if [[ -f ~/DBData/$1/$name ]]
then
echo -e "\e[31mthis table name alredy exist\e[0m"
else
touch ~/DBData/$1/$name
touch ~/DBData/$1/$name+"p"
echo -e "\e[1mif you finished entering data press esc\e[0m"
while true;
do
echo "enter your coulmns name plz"
read -a arr
if [[ ${arr[@]} == "" ]]
then
echo -e "\e[31mYou didn't enter yor name please try again\e[0m"
else
if [[ ${arr[@]} = $'\033' ]]
then
break 
else
for i in ${arr[@]}
do
if grep -Fq "$i|" ~/DBData/$1/$name
then
echo -e "\e[31mthis coloumn is already exist\e[0m"
else
COULMN 12 2>/dev/null
select opt in "string 1" "int 2"
do
case $opt in
#"string 1") printf "string|" >> ~/DBData/$1/$name+"p" ;break ;;
"string 1") type="string|" ;break ;;
"int 2") type="int|" ; break ;;
*) echo -e "\e[31mnot valid choice\e[0m" ;;
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
*) echo -e "\e[31mnot valid\e[0m"; break ;;
esac
done
else
printf "$i|" >> ~/DBData/$1/$name
fi
fi
printf "$type" >> ~/DBData/$1/$name+"p"
done
fi
fi
done
echo >> ~/DBData/$1/$name
fi
fi
