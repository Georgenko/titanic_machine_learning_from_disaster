#!/bin/bash

sed 's/^[ \t]*//;s/[ \t]*$//;/^$/d;/^#/d;s/\(.*\) \(.*\)/\1,\2/' -i submit_predictions.csv 
sed -i '1iPassengerId,Survived' submit_predictions.csv
