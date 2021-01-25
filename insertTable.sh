#!/usr/bin/bash
echo please Enter your table name 
read TableName
if [[ -f ~/DBData/$1/$TableName ]]
then
	sed -n '1p' ~/DBData/$1/$TableName | awk '-F|' '{for(i=1;i<NF;i++) print $i}'	
else 
echo there is no table has name $TableName
fi

