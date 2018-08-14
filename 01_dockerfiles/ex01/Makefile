IMG="teamspeak:ex01"
CONTAINER_NAME="teamspeak_server"
LOCATION=./


.PHONY: all, build, check, run, clean, fclean

all: build run

build:
	docker build -t $(IMG) $(LOCATION)

run:
	docker run -it --name $(CONTAINER_NAME) $(IMG)

check:
	docker image ls
	@echo
	docker ps -a

clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# clean container and image
fclean: clean
	docker rmi $(IMG) || true