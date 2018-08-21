IMG_FATHER="ft-rails:on-build"
IMG_SON="ft-rails:son"
CONTAINER_NAME="tadada"
LOCATION_FATHER=./father
LOCATION_SON=./son
PORTS=-p 3001:3001
VM=Char
IP=$(shell docker-machine ip $(VM))
if [ "$(shell uname)" = 'Linux' ]; then OPEN=xdg-open ; else OPEN=open; fi

.PHONY: all, build_father, build, build_son, check, logs, run, clean, fclean

all: build run

build: build_father build_son

build_father:
	docker build -t $(IMG_FATHER) $(LOCATION_FATHER)

build_son:
	docker build -t $(IMG_SON) $(LOCATION_SON)

run:
	docker run -d --name $(CONTAINER_NAME) $(PORTS) --rm $(IMG_SON) \

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
	docker rmi $(IMG_FATHER) $(IMG_SON) || true