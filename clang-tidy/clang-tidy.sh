#!/bin/bash

mkdir ../visual/build && cd ../visual/build
qmake -makefile ../GraphVisual/graph.pro > /dev/null
bear -- make > /dev/null
cd ../../clang-tidy

CURRENT_DIR=$(pwd)
PROJECT_DIR="${CURRENT_DIR}/../visual/GraphVisual"
BUILD_DIR="${PROJECT_DIR}/../build"
OUTPUT_FILE="${CURRENT_DIR}/clang-tidy-output.txt"

find "${PROJECT_DIR}" \( -name "*.cpp" -o -name "*.h" \) -print0 \
  | xargs -0 -n 1 clang-tidy \
      -p "${BUILD_DIR}" \
      --header-filter=".*" \
      -extra-arg=-isystem,/home/matija/Qt/5.15.2/gcc_64/include\
      -extra-arg=-I"${PROJECT_DIR}/Headers" \
      -extra-arg=-I/usr/include/c++/11 \
      -extra-arg=-I/usr/include/x86_64-linux-gnu/c++/11 \
      -extra-arg=-I"${BUILD_DIR}"\
      -checks=-clang-analyzer-webkit.RefCntblBaseVirtualDtor \
  > "${OUTPUT_FILE}"

rm -rf ../visual/build

