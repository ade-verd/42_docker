#! /bin/bash

OS=$(uname)
VM=Char
IP=$(docker-machine ip $VM)
URL_TS3=ts3server://$IP
URL_HTML=http://www.teamspeak.com/invite/$IP

TOKEN=$(docker logs teamspeak_server | grep token | sed 's/.*token=//' | sed 's/\r//g' | head -1)
LOGIN=$(docker logs teamspeak_server | grep login | awk '{split($$0, i, ", "); print i[1]}' | tr -d '\t\r\" ')
PASSWD=$(docker logs teamspeak_server | grep login | awk '{split($$0, i, ", "); print i[2]}' | tr -d '\t\r\" ')

TIMES=0
TIMEOUT=60

while [ -z "$TOKEN" ]; do
	if [ $TIMES -eq 0 ]; then
		echo -n "Waiting for ServerAdmin Privilege Key "
	fi
	echo -n "."
	sleep 1 && ((TIMES++))
	TOKEN=$(docker logs teamspeak_server | grep token | sed 's/.*token=//' | sed 's/\r//g' | head -1)
	if [ $TIMES -eq $TIMEOUT ]; then
		echo && echo "timeout"
		echo "can't get Privelege Key" && echo
		TOKEN="GetError: Please run: docker logs teamspeak_server | grep token"
	fi
done
echo 
echo $URL_HTML
echo $URL_TS3
echo "ServerAdmin:"
echo "  PrivilegeKey=$TOKEN"
echo "  $LOGIN"
echo "  $PASSWD"
