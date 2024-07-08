#!/bin/bash
#PBS -q qexp
#PBS -A DD-22-68
#PBS -l select=1:ncpus=36,vtune=2022_2_0
#PBS -l walltime=0:10:00
#PBS -m e
#PBS -N AVS-vtune


cd $PBS_O_WORKDIR
ml intel-compilers/2022.1.0 CMake/3.23.1-GCCcore-11.3.0 VTune/2022.2.0-intel-2021b

[ -d build_vtune ] && rm -rf build_vtune
[ -d build_vtune ] || mkdir build_vtune
cd build_vtune

CC=icc CXX=icpc cmake ..
make

for threads in 18 36; do
    for builder in "ref" "loop" "tree"; do
        rm -rf vtune-${builder}-${threads}
        vtune -collect threading -r vtune-${builder}-${threads} -app-working-dir . -- ./PMC --builder ${builder} -t ${threads} --grid 128 ../data/bun_zipper_res3.pts
    done
done
