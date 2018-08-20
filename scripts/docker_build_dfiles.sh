#! /bin/bash

VM="Char"

set -x

eval $(docker-machine env $VM)
make -C ../01_dockerfiles/ex00 build > build_ex00.log
make -C ../01_dockerfiles/ex01 build > build_ex01.log
make -C ../01_dockerfiles/ex02 build > build_ex02.log
make -C ../01_dockerfiles/ex03 build > build_ex03.log
make -C ../01_dockerfiles/ex03 run > run_ex03.log