#! /bin/bash

VM="Char"
MAKE=make
CURDIR=${PWD##*/}
TESTDIR=scripts
if [ "$CURDIR" = "$TESTDIR" ]; then DIR=".."; else DIR="."; fi

set -o xtrace

$MAKE -C $DIR/01_dockerfiles/ex00/ build
$MAKE -C $DIR/01_dockerfiles/ex01/ build
$MAKE -C $DIR/01_dockerfiles/ex02/ build
$MAKE -C $DIR/01_dockerfiles/ex03/ build
$MAKE -C $DIR/01_dockerfiles/ex03/ run