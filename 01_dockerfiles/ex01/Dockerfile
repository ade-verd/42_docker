FROM debian:latest

ENV TS3_VERSION=3.3.0

RUN apt-get update -y && apt-get upgrade \
	&& apt-get install -y mariadb-client mariadb-server

ENV MYSQL_ROOT_PASSWORD toor

http://dl.4players.de/ts/releases/3.3.0/teamspeak3-server_linux_amd64-$TS3_VERSION.tar.bz2


CMD [ "vim" ]

# Sources:
# https://www.digitalocean.com/community/questions/tutorial-setup-teamspeak-server-debian-9-3