IMG="gitlab"
CONTAINER_NAME="fox_ginger"
LOCATION=./
PORTS=-p 8022:22 -p 8443:443 -p 8083:80
VM=Char
IP=$(shell docker-machine ip $(VM))
if [ "$(shell uname)" = 'Linux' ]; then OPEN=xdg-open ; else OPEN=open; fi

.PHONY: all, build, check, logs, run, clean, fclean

all: build run

build:
	docker build -t $(IMG) $(LOCATION)

run:
	docker run -d --name $(CONTAINER_NAME) $(PORTS) --privileged $(IMG)

check:
	docker image ls
	@echo
	docker ps -a
	@echo
	./open.sh

logs:
	docker logs $(CONTAINER_NAME) --follow

clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# clean container and image
fclean: clean
	docker rmi $(IMG) || true