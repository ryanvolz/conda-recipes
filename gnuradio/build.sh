#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

mkdir build
cd build
cmake ../ \
    -DENABLE_TESTING=OFF \
    -DBOOST_INCLUDEDIR=$PREFIX/include \
    -DBOOST_LIBRARYDIR=$PREFIX/lib \
    -DBoost_NO_SYSTEM_PATHS=ON \
    -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
    -DZEROMQ_INCLUDE_DIRS=$PREFIX/include \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX
make
make test
make install
