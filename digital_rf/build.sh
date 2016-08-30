#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

sh autogen.sh
mkdir build
cd build
../configure --prefix=${PREFIX}
make
make install

cd ..
$PYTHON setup.py install
