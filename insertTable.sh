#!/usr/bin/bash
typeset -i primColNum
primColNum=0;exist=0;valid=0
echo please Enter your table name 
read TableName
if [[ -f ~/DBData/$1/$TableName ]]
then
	colNameArr=$(sed -n '1p' ~/DBData/$1/$TableName | awk '-F|' '{for(i=1;i<NF;i++)  print $i }')
else 
echo there is no table has name $TableName
fi
for colNam in ${colNameArr[@]}
do 
	valid=0;
	while [[ $valid -eq 0 ]]
	do
   if [[ "$colNam" == "*"* ]]
   then
   primaryCol=$(awk '-F|' '{if(NR>1) print $($primColNum+1)}' ~/DBData/$1/$TableName)
     
     
	  echo Enter the value for $colNam as primary key | sed 's/*//'                   
           read colData
       if [[ -z $colData ]]
           then
            echo "the primary can't be null "
    else
	    for primVal in ${primaryCol[@]}
           do
           if [[ "$colData" == "$primVal" ]]
          then		   
            exist=1;
           fi
           done
       if [[ $exist -eq 0 ]]
           then           valid=1
   else echo "this value is added before"
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
	valid=1	
     fi     
   fi
done   
printf "$colData|" >> ~/DBData/$1/$TableName
primColNum=$((primColNum + 1))
 
done
