#!/usr/bin/bash
exist=0 i=1; valid=0;PrimCheck=1;primCol=0,found=0
function findColumn {
for colName in ${colNameArr[@]}
do
         if [[ "$colName" == "*"* ]]
         then
                 colName=$(echo $colName | sed 's/*//g')
		 primCol=$i
        fi
        if [[ "$colName" == "$1" ]]
        then
                exist=1
        selectedCol=$i
        fi
        i=$((i + 1))
done
return $selectedCol
}

function CheckValue {
	if [[ "$1" == "string" ]] 
	then valid=1
	else if [[ "$1" == "int" ]]
	then if [[ "$2" =~ ^[+-]?[0-9]+$ ]]
	then valid=1
       	fi
	   fi	
	fi	
}
function checkPrimary {

for primVal in ${primaryCol[@]}
do
if [[ "$1" == "$primVal" ]] 
then PrimCheck=0; 
fi
done
return $PrimCheck
}
echo please select Table:
read TableName
if [[ -f ~/DBData/$1/$TableName ]]
then
        colNameArr=$(sed -n '1p' ~/DBData/$1/$TableName | awk '-F|' '{for(i=1;i<NF;i++)  print $i }')
echo "Enter the where condition (column name = value)"
read statement
condCol=$(echo $statement | sed 's/ //g'| awk -F= '{print $1}')
value=$(echo $statement |sed 's/ //g'|  awk -F= '{print $2}')
i=1;
findColumn $condCol
if [[ $exist -eq 1 ]]
then
exist=0	
if [[ -z "$value" ]]
then echo -e "\e[31mvalue not found\e[0m"

else	
Row+=($(awk '-F|' 'BEGIN{i=0}{i++;if ($'$selectedCol' == "'$value'")  print i}' ~/DBData/$1/$TableName))
if [[ -z "$Row" ]]
then echo -e "\e[31mvalue not found in this column\e[0m"

else
echo "Enter the set Statement (column name = value)"
read statement2
setCol=$(echo $statement2 | sed 's/ //g'| awk -F= '{print $1}')
setValue=$(echo $statement2 |sed 's/ //g'|  awk -F= '{print $2}')
i=1
findColumn  $setCol
if [[ $exist -eq 1 ]]
then exist=0
if [[ -z "$setValue" ]]
then echo -e "\e[31mvalue not found\e[0m"

else
DataType=$(sed -n '1p' ~/DBData/$1/$TableName+"p" | cut -d '|' -f $selectedCol)
primaryCol=$(cut -d '|' -f $primCol ~/DBData/$1/$TableName | awk  '{if(NR>1) print $0}' )

CheckValue $DataType $setValue

if [[ "$valid" == "1" ]]
then
NumberOfRows=${#Row[@]}
if [[ "$primCol" == "$selectedCol"  ]]
then checkPrimary $setValue
 if [[ $NumberOfRows -eq 1 ]]
then 
if [[ $PrimCheck -ne 1 ]]
then
echo -e "\e[31mprimary key must be unique\e[0m"
else
found=1
fi
else echo -e "\e[31myou can't change more than one record with the same primary key value\e[0m"

fi 
else found=1
fi
if [[ $found -eq 1 ]]
then
for R in ${Row[@]}
do
NeddedRow=$(awk  'BEGIN{FS="|";OFS="|"}{if(NR=='$R') {$'$selectedCol'='$setValue'; print $0;}}'  ~/DBData/$1/$TableName)
all=$(awk -v myvar=$NeddedRow '{if(NR=='$R'){ print myvar}else{print $0}}' ~/DBData/$1/$TableName)
printf "" > ~/DBData/$1/$TableName
for line in $all
do
echo $line >> ~/DBData/$1/$TableName
done
done
fi
else echo -e "\e[31minvalid Data Type\e[0m"
fi
fi
else echo -e "\e[31mthere is no column has Name $setCol\e[0m"

fi

fi
fi
else echo -e "\e[31mthere is no column has Name $condCol\e[0m"
fi
else
echo -e "\e[31mthere is no table has name $TableName\e[0m"
fi


