#!/usr/bin/bash

mkdir ../visual/build && cd ../visual/build
qmake ../GraphVisual/graph.pro > /dev/null
make > /dev/null
cd ../../memcheck

valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all  --log-file="$(date +%s).memcheck.out" ../visual/build/graph

rm -rf ../visual/build
