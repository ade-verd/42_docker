IMG="alpivim:ex00"
CONTAINER_NAME="alpivim"
LOCATION=./


.PHONY: all, build, check, logs, run, clean, fclean

all: build run

build:
	docker build -t $(IMG) $(LOCATION)

run:
	docker run -it --name $(CONTAINER_NAME) $(IMG)

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