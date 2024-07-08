#!/bin/bash
#

ml intel-compilers CMake
ml intel/2021b

ml VTune/2022.2.0-intel-2021b
CC=icc
CXX=icpc
cmake ..
make -j
./PMC --builder tree  ../data/bun_zipper_res1.pts bun_zipper_res1.obj

# python3  ../scripts/check_output.py bun_zipper_res4.obj bun_zipper_res4_ref.obj
