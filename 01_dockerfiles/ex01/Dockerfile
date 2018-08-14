FROM debian:latest

# Teamspeak Server version
ENV TS3_VERSION 3.3.0

# Update, upgrade and install packages. 
# Clean cache and useless packages
RUN 	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		curl \
		bzip2 \
	&& apt-get autoremove -y \
	&& apt-get clean 

RUN curl -fsSL http://dl.4players.de/ts/releases/${TS3_VERSION}/teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2 | tar -jxvf - -C /opt/ && \
	mv /opt/teamspeak3-server_linux_amd64 /opt/teamspeak3

# Set the OS environment variable TS3SERVER_LICENSE to "accept" (cf. ./doc/quickstart.txt)
ENV TS3SERVER_LICENSE accept




