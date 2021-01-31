#!/usr/bin/bash
typeset -i ColNum
ColNum=1;exist=0;valid=0
echo please Enter your table name 
read TableName

if [[  ! -f ~/DBData/$1/$TableName ]]
then
	echo -e "\e[31mthere is no table has name $TableName\e[0m"
else 
colNameArr=$(sed -n '1p' ~/DBData/$1/$TableName | awk '-F|' '{for(i=1;i<NF;i++)  print $i }')

for colNam in ${colNameArr[@]}
do 
	DataType=$(sed -n '1p' ~/DBData/$1/$TableName+"p" | cut -d '|' -f $ColNum)
	valid=0;
	while [[ $valid -eq 0 ]]
	do
   if [[ "$colNam" == "*"* ]]
   then
   #primaryCol=$(awk '-F|' '{if(NR>1) print $($ColNum)}' ~/DBData/$1/$TableName)
    primaryCol=$(cut -d '|' -f $ColNum ~/DBData/$1/$TableName | awk  '{if(NR>1) print $0}' ) 
	  echo Enter the value for $colNam as primary key | sed 's/*//'                   
           read colData
       if [[ -z $colData ]]
           then
            echo -e "\e[31mthe primary can't be null\e[0m"
            
    else
	    for primVal in ${primaryCol[@]}
           do
           if [[ "$colData" == "$primVal" ]]
          then		   
            exist=1;
           fi
           done
       if [[ $exist -eq 0 ]]
          then 
     if [[ "$DataType" == "int" ]]
        then
         if [[ $colData =~ ^[+-]?[0-9]+$ ]]
        then valid=1;
       else echo -e "\e[31mthe dataType of this column is int so try again\e[0m"
       
         fi
 else valid=1;
        fi

   else echo -e "\e[31mthis value is added before\e[0m"
         exist=0 	   
          fi

       fi	    
   else
    echo Enter the value of column $colNam
     read colData
     if [[ -z $colData ]]
      then colData="Null"
	 valid=1    
	else
	
	if [[ "$DataType" == "int" ]]
	then	
	       if [[ $colData =~ ^[+-]?[0-9]+$ ]]
	then valid=1;
       else echo -e "\e[31mthe dataType of this column is int so try again\e[0m"
       
         fi
 else valid=1;
	fi	
    fi     
   fi
done   
printf "$colData|" >> ~/DBData/$1/$TableName
ColNum=$((ColNum + 1))
 
done
echo >> ~/DBData/$1/$TableName

fi
