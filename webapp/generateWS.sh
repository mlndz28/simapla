#!/bin/bash

if (( $(ps -ef | grep -v grep | grep "sails lift" | wc -l) > 0 ))
then
(cd ../webservice/generator; node proceduresSails)
else
printf "Webapp must be running before generating the controllers\n\n\tTip: use 'sails lift'\n\n"
fi
