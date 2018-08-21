#! /bin/bash

VM="Char"
CURDIR=${PWD##*/}
TESTDIR=scripts
if [ "$CURDIR" = "$TESTDIR" ]; then DIR=".."; else DIR="."; fi

set -o xtrace

make -C $DIR/01_dockerfiles/ex00/ build
make -C $DIR/01_dockerfiles/ex01/ build
make -C $DIR/01_dockerfiles/ex02/ build
make -C $DIR/01_dockerfiles/ex03/ build