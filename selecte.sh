#!/bin/bash
Colnum=1
exist=0
rownumber=1
counter=1
echo "Enter the value of primary key for row you want to select"
read value
colNameArr=$(sed -n '1p' ~/DBData/$1/$name | awk '-F|' '{for(i=1;i<NF;i++)  print $i }')
for cu in $colNameArr
do
if [[ "$cu" == "*"* ]]
then
primaryCol=$(cut -d '|' -f $Colnum ~/DBData/$1/$name | awk  '{if(NR>1) print $0}' )
fi
Colnum=$((Colnum + 1))
done
#echo $primaryCol
for co in $primaryCol
do

if [[ "$co" == "$value" ]]
then

exist=1
rownumber=$counter;
fi
counter=$((counter + 1));
done
if [[ "$exist" -eq "1" ]]
then

cil=$(awk '-F|' '{if (NR=='$((rownumber+1))') {for(i=1;i<NF;i++) print $i}}' ~/DBData/$1/$name)
echo $cil

else
echo " not valid number"
fi

