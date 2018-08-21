#! /bin/bash

OS=$(uname)
VM=Char
IP=$(docker-machine ip $VM)
PORT=8083
URL=http://$IP:$PORT
if [ "$OS" = 'Linux' ]; then OPEN="xdg-open" ; else OPEN="open"; fi

set -o errexit

read -p "open $URL [yY] ? " -n 1 -r
if [[ $REPLY =~ ^[yY]$ ]]; then
	(set -x; $OPEN $URL)
fi
