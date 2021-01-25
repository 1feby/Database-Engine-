#!/bin/bash
if [ -d ~/DBData/$1 ]
then
ls ~/DBData/$1
fi
path=$(ls ~/DBData/$1)
if [[ -z "$path" ]]
then
echo "there is no tables to list "
fi
