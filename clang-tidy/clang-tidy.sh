#!/bin/bash

CURRENT_DIR=$(pwd)
PROJECT_DIR="${CURRENT_DIR}/../visual/GraphVisual"
BUILD_DIR="${PROJECT_DIR}/../build-graph-Desktop_Qt_5_15_2_GCC_64bit-Debug"


cd "${BUILD_DIR}" || exit
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "${PROJECT_DIR}"


find "${PROJECT_DIR}" \( -name "*.cpp" -o -name "*.h" \) -print0 \
  | xargs -0 clang-tidy \
      -p "${BUILD_DIR}" \
      --header-filter=".*" \
      -extra-arg=-isystem,/home/matija/Qt/5.15.2/gcc_64/include\
      -extra-arg=-I"${PROJECT_DIR}/Headers" \
      -extra-arg=-I/usr/include/c++/11 \
      -extra-arg=-I/usr/include/x86_64-linux-gnu/c++/11 \
      -extra-arg=-I"${BUILD_DIR}"\
      -quiet

