#!/bin/bash
#


CC=icc
CXX=icpc
cmake ..
make -j
./PMC --builder loop  ../data/bun_zipper_res4.pts bun_zipper_res4.obj

python3  ../scripts/check_output.py bun_zipper_res4.obj bun_zipper_res4_ref.obj
