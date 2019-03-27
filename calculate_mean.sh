#!/bin/bash

length=$(awk -F ',' '{print$3}' first_approach|sort|uniq -c|grep -v '^[ \t]*[0-9]*[ \t]*$'|sed 's/^[ \t]*\|[ \t]*$//'|awk -F ' ' '{print$1}'|awk '{n+=$1};END{print n}')
sum_of_all=$(awk -F ',' '{print$3}' first_approach|sort|uniq -c|grep -v '^[ \t]*[0-9]*[ \t]*$'|sed 's/^[ \t]*\|[ \t]*$//'|awk -F ' ' '{print$1*$2}'|awk '{n+=$1};END{print n}')

#echo $length
#echo $sum_of_all
printf "%.1f\n" $(echo "scale=2;$sum_of_all/$length"|bc|sed 's/\./,/')|sed 's/,/\./'




