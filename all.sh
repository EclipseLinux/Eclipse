#!/bin/zsh

make menuconfig -j12
make -j12
./final.sh
