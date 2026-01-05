#!/bin/bash

IP=$(cat serverIP.csv | awk 'NR>1' | cut -d , -f2)

for i in $IP
do
    ping -c 1 $i 1> /dev/null  # Redirecting standard output to /dev/null to suppress output
    status=$(echo $?)
    if [[ $status -eq 0 ]]
    then
        echo "$i is connected"
    else
        echo "$i is not connected"
    fi
done



# Reading server.csv file & extracting the 2nd column (IP addresses) excluding the header

#IP=$(cat serverIP.csv | awk 'NR>1' | cut -d , -f2)

#for i in $IP
#do
# echo $i
#done

: <<'COMMENT'

Cleaning Up "Noise" (Filtering). Redirection Operators can be used to control where the output of commands go
Following are the redirection operators:

> --> File output redirect
1> --> output redirect
2> --> error redirect
&> standard output and standard error redirect

COMMENT