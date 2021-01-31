#!/bin/bash
if [ -d ~/DBData/$1 ]
then
ls ~/DBData/$1 | grep -v '\+'
fi
path=$(ls ~/DBData/$1)
if [[ -z "$path" ]]
then
echo -e "\e[31mthere is no tables to list\e[0m "
fi
