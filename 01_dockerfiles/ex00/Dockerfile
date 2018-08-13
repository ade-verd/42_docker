FROM alpine:latest

RUN apk update && apk add vim

CMD [ "-D", "FOREGROUND" ]
CMD [ "vim" ]

# Sources:
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# FROM creates a layer from the ubuntu:15.04 Docker image.
# RUN builds your application with make.
# CMD specifies what command to run within the container.