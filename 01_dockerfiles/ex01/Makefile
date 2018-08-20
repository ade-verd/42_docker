IMG="teamspeak:ex01"
CONTAINER_NAME="teamspeak_server"
LOCATION=./
PORTS=-p 9987:9987/udp -p 10011:10011 -p 30033:30033
VM=Char
IP=$(shell docker-machine ip $(VM))
URL_TS3=ts3server://$(IP)
URL_HTML=http://www.teamspeak.com/invite/$(IP)
OS=`uname`

.PHONY: all, build, check, get-info, logs, open, run, clean, fclean

all: build run

build:
	docker build -t $(IMG) $(LOCATION)

run:
	docker run -dit --name $(CONTAINER_NAME) $(PORTS) --rm $(IMG) \
	&& echo \
	&& ./getinfo.sh \
	&& ./open.sh

check:
	docker image ls
	@echo
	docker ps -a

logs:
	docker logs $(CONTAINER_NAME) --follow

clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# clean container and image
fclean: clean
	docker rmi $(IMG) || true