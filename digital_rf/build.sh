#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

sh autogen.sh
mkdir build
cd build
../configure --prefix=${PREFIX}
make
make check
source/test_rf_write_hdf5
make install

cd ..
$PYTHON setup.py install
