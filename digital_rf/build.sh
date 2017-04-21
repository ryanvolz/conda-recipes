#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

# make builds with gcc>=5 compatible with conda-forge, currently using gcc<5
CXXFLAGS="${CXXFLAGS} -D_GLIBCXX_USE_CXX11_ABI=0"

mkdir build
cd build
cmake ../ \
    -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX
make
make test
rm -r /tmp/hdf5
make install
