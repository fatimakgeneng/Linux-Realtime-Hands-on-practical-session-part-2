#!/bin/bash

IP=$(cat serverIP.csv | awk 'NR>1' | cut -d , -f2)
failed_count=0
conn_count=0
for i in $IP
do
ping -c 1 $i 1> /dev/null
status=$(echo $?)
if [[ $status -eq 0 ]]
then
echo "$i is connected"
#ssh aadmin@$i "hostname"
sshpass -f pass.txt ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No aadmin@$i "uname" 2> /dev/null
conn_count=$((conn_count + 1 ))
else
echo "$i is not connected"
failed_count=$((failed_count + 1 ))
fi
done

echo "Total $conn_count is connected"
echo "Total $failed_count is not connected"






#IP=$(cat serverIP.csv | awk 'NR>1' | cut -d , -f2)

#conn_count=0
#for i in $IP
#do
    #ping -c 1 $i 1> /dev/null
    #status=$(echo $?)
    #if [[ $status -eq 0 ]]
    #then
        #echo "$i is connected"
        #ssh aadmin@$i "hostname"
        #sshpass -f pass.txt ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No aadmin@$i "uname" 2> /dev/null
        #conn_count=$((conn_count + 1 ))
    #else
        #echo "$i is not connected"
    #fi
#done

#echo "Total $conn_count is connected"






#IP=$(cat serverIP.csv | awk 'NR>1' | cut -d , -f2)

#for i in $IP
#do
    #ping -c 1 $i 1> /dev/null
    #status=$(echo $?)
    #if [[ $status -eq 0 ]]
    #then
        #echo "$i is connected"
        #ssh aadmin@$i "hostname"
    #else
        #echo "$i is not connected"
    #fi
#done