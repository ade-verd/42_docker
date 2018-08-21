#! /bin/bash
docker stop $(docker ps -a -q)
docker rm --force $(docker ps -a -q)