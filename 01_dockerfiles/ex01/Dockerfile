FROM debian:latest

# TS3_VERSION:			Teamspeak Server version
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

# Download and install Teamspeak
RUN curl -fsSL http://dl.4players.de/ts/releases/${TS3_VERSION}/teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2 | tar -jxvf - -C /opt/ \
	&& mv /opt/teamspeak3-server_linux_amd64 /opt/teamspeak3

# Ports
#-p 9987:9987/udp 	default voice port
#-p 10011:10011		server query port
#-p 30033:30033		file transport port
EXPOSE 	9987/udp 10011 30033

ENV TS3SERVER_LICENSE=accept \
	LD_LIBRARY_PATH="/opt/teamspeak3 /opt/teamspeak3/ts3server"

# Run ./ts3server
CMD [ "./opt/teamspeak3/ts3server_minimal_runscript.sh"]
