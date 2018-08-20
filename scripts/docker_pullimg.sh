#! /bin/bash

VM="Char"

eval $(docker-machine env $VM)
docker pull hello-world:latest
docker pull nginx:latest
docker pull alpine:latest
docker pull debian:latest
docker pull mysql:latest
docker pull wordpress:latest
docker pull phpmyadmin/phpmyadmin:latest
docker pull python:2-slim
docker pull rabitmq:latest
docker pull 42school/engineering-bay:latest
docker pull 42school/marine-squad:latest