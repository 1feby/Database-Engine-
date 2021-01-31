#!/bin/bash
if [ -d ~/DBData ]
then
 ls ~/DBData
fi
path=$(ls ~/DBData)
if [[ -z "$path" ]]
then
echo -e "\e[31mthere is no DataBases to list\e[0m "
fi

