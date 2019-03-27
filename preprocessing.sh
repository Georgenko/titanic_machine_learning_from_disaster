#!/bin/bash

#first approach:passenger class, sex, age
awk -F ',' '{print$3","$6","$7","$2}' train.csv|tail -n +2>data

#male->0
#female->1
sed 's/,male/,0/;s/,female/,1/' -i data

#calculates the mean for feature age and substitute all empty values in data
length=$(awk -F ',' '{print$3}' data|sort|uniq -c|grep -v '^[ \t]*[0-9]*[ \t]*$'|sed 's/^[ \t]*\|[ \t]*$//'|awk -F ' ' '{print$1}'|awk '{n+=$1};END{print n}')
sum_of_all=$(awk -F ',' '{print$3}' data|sort|uniq -c|grep -v '^[ \t]*[0-9]*[ \t]*$'|sed 's/^[ \t]*\|[ \t]*$//'|awk -F ' ' '{print$1*$2}'|awk '{n+=$1};END{print n}')
mean=$(printf "%.1f\n" $(echo "scale=2;$sum_of_all/$length"|bc|sed 's/\./,/')|sed 's/,/\./')
sed -i "s/,,/,$mean,/" data




cat data
