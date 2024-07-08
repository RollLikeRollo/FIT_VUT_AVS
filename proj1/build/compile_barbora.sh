ml intel-compilers/2022.1.0 CMake/3.23.1-GCCcore-11.3.0 
CC=icc
CXX=icpc
cmake ..
make -j

ml SciPy-bundle
./mandelbrot -c line -s 1024 -i 100 lineb.npz
./mandelbrot -c batch -s 1024 -i 100 batchb.npz
#python3 ../scripts/visualise.py lineb.npz  --save img_b.png
