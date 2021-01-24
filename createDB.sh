#!/usr/bin/bash
if [ ! -d ~/DBData ]
then
    mkdir ~/DBData
   echo welcome , your databases will be saved in ~/DBData 
else
    echo your Databases in ~/DBData
fi 
echo please Enter the name of Data base 
read DBName
while [ -f ~/DBData/$DBName ]
do	
echo the name of Database is ready exist
echo please enter the database 
read DBName
done
touch ~/DBData/$DBName
 
