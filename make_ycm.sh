#!/bin/bash

. make_ycm.site.conf
echo "PATH_TO_PYTHON_LIBRARY = ${PATH_TO_PYTHON_LIBRARY}"
echo "PATH_TO_PYTHON_INCLUDE_DIR = ${PATH_TO_PYTHON_INCLUDE_DIR}"
echo "PATH_TO_GCC = ${PATH_TO_GCC}"
echo "PATH_TO_LIBCLANG = ${PATH_TO_LIBCLANG}"

mkdir -p ~/tmp/ycm_build &&
cd ~/tmp/ycm_build &&
cmake -G "Unix Makefiles" \
      -DPYTHON_LIBRARY=${PATH_TO_PYTHON_LIBRARY}/libpython2.7.so \
      -DPYTHON_INCLUDE_DIR=${PATH_TO_PYTHON_INCLUDE_DIR}/python2.7 \
      -DCMAKE_CXX_COMPILER=${PATH_TO_GCC}/g++ \
      -DCMAKE_C_COMPILER=${PATH_TO_GCC}/gcc \
      -DEXTERNAL_LIBCLANG_PATH=${PATH_TO_LIBCLANG}/libclang.so \
      ~/.vim/bundle/YouCompleteMe/cpp &&
make ycm_core
