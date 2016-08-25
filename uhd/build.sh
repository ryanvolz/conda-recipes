#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

cd host
mkdir build
cd build
cmake ../ \
    -DBOOST_INCLUDEDIR=$PREFIX/include \
    -DBOOST_LIBRARYDIR=$PREFIX/lib \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX
make
make test
make install
