#!/usr/bin/bash
if [ ! -d ~/DBData ]
then
    mkdir ~/DBData
   echo -e "welcome , your databases will be saved in ~/DBData "
   else
    echo "your Databases in ~/DBData"
fi 
echo "please Enter the name of Data base" 

read DBName
if [ -d ~/DBData/$DBName ]
then	
echo -e "\e[31mthe name of Database is ready exist\e[0m"

else mkdir ~/DBData/$DBName
fi

 
