#! /bin/bash
docker rmi --force $(docker images -q)