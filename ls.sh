#!/bin/bash
if [ -d ~/DBData ]
then
 ls ~/DBData
fi
path=$(ls ~/DBData)
if [[ -z "$path" ]]
then
echo "there is no DataBases to list "
fi

