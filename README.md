# Linux-Realtime-Hands-on-practical-session-part-2

### Task
For numbering with , :  `df -h | awk 'NR>1' | awk '{ print NR "," $0}'` <br>
For space into , : `df -h | awk 'NR>1' | awk '{ print NR "," $0}' | sed -E 's/ +/,/g'` <br>
for removing percentage  `df -h | awk 'NR>1' | awk '{ print NR "," $0}' | sed -E 's/ +/,/g' | sed -E 's/%//g'` <br>
for , & date at the end : `df -h | awk 'NR>1' | awk '{ print NR "," $0}' | sed -E 's/ +/,/g' | sed -E 's/%//g' | sed "s/$/,$(date +%d-%m-%y)/g"` <br>


`ifconfig  | awk 'NR==2' | awk '{print $2}'` <br>
`hostname -I | awk '{print $1}'` --> Option 2 <br>
`df -h | awk 'NR>1' | awk '{ print NR "," $0}' | sed -E 's/ +/,/g' | sed -E 's/%//g' | sed "s/$/,$(date +%d-%m-%y)/g" | sed "s/$/,$(hostname -I | awk '{print $1}')/g"` <br> <br>

Final ANS: **`df -h | awk 'NR>1' | awk '{ print NR "," $0}' | sed -E 's/ +/,/g' | sed -E 's/%//g' | sed "s/$/,$(date +%d-%m-%y)/g" | sed "s/$/,$(hostname -I | awk '{print $1}')/g" | sed "s/$/,$(hostname)/g"`** <br>

**To save the above result in csv format**
`df -h | awk 'NR>1' | awk '{ print NR "," $0}' | sed -E 's/ +/,/g' | sed -E 's/%//g' | sed "s/$/,$(date +%d-%m-%y)/g" | sed "s/$/,$(hostname -I | awk '{print $1}')/g" | sed "s/$/,$(hostname)/g" > out.csv`

### You need ready two server in your env with below details:-
### useradd aadmin
### passwd aadmin

### 2. Filtering in .csv file  (serverIP.csv)

**`cat serverIP.csv` or `vi serverIP.csv`**  --> to create & edit file in bash <br>

**`cat serverIP.csv | awk 'NR>1' | cut -d , -f2`** --> Displays the IP addresses <br>
`awk 'NR>1'` --> Header Remover --> only pass along lines where the "No. of Records" (row) is greater than 1 <br>
`cut -d , -f2`   `cut` --> vertical slicer `-d` --> (Delimiter) columns are separated by , --> `-f2` (field 2) 2nd column <br>

**`cat serverIP.csv | awk 'NR>1' | cut -d , -f3`** --> Diplays servers <br>

### 3. `ping` A network diagnostic tool, tests if a specific computer or server is reachable & how fast the connection is.

**`ping 192.168.1.8`** --> can copy the ip from serverIP.csv file. <br>
**`echo $?`** --> if answer is 0 then command ran successfully; if 1 then unsuccessful --> press `Ctrl+C` to stop <br>
**`ping 192.168.1.8 -c 1`** --> count 1 --> `-c 1` tells to send exactly one packet & then stop

### 4. host_connection via For Loop (host_connection.sh)

### 5. Please generate your ssh-keygen for password less

**`ssh-keygen`** --> creates a key pair for secure, password-less logins between computers. <br>
**`cd /home/aadmin/.ssh/`** --> To go in ssh dir
**`ssh-copy-id 192.168.1.8`** This command is the "delivery service" for your SSH keys. It takes the Public Key (the lock) you just created with ssh-keygen and installs it onto the remote server at 192.168.1.8. <br>

Result will be: <br>
```bash
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/aadmin//.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
aadmin@192.168.1.8's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh '192.168.1.8'"
and check to make sure that only the key(s) you wanted were added.
```

### 6. Two way communication (host_connection1.sh 3 exanples):-

 **1. Password less**
**`ssh 192.168.1.8`**


**2. Password based**
**`apt-get install sshpass`** <br>
**`yum install ssh-pass`** <br>
**`o "ifconfig"`** <br>


**`sshpass -f pass.txt ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No aadmin@192.168.1.8 "hostname;ifconfig"`** <br>

**`sshpass -f pass.txt ssh -n -o StrictHostKeyChecking=No -o PubkeyAuthentication=No aadmin@192.168.1.8 "hostname;ifconfig;date"`** <br>

**`ssh-copy-id -f localhost`**






