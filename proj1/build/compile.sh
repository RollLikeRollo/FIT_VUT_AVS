CC=icc
CXX=icpc
cmake ..
make -j

./mandelbrot -c batch -s 1024 batch.npz
python3 ../scripts/visualise.py batch.npz --save imgbatch.png # --show
