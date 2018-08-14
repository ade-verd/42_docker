#! /bin/bash

OS=$(uname)
VM=Char
IP=$(docker-machine ip $VM)
URL_TS3=ts3server://$IP
URL_HTML=http://www.teamspeak.com/invite/$IP
if [ "$OS" = 'Linux' ]; then OPEN="xdg-open" ; else OPEN="open"; fi

set -o errexit

read -p "open $URL_TS3 [yY] ? " -n 1 -r
if [[ $REPLY =~ ^[yY]$ ]]; then
	(set -x; $OPEN $URL_TS3 || $OPEN $URL_HTML)
fi
