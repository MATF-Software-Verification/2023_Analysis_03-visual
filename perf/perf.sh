#!/usr/bin/bash

mkdir ../visual/build && cd ../visual/build
qmake QMAKE_CXXFLAGS+=-g  ../GraphVisual/graph.pro > /dev/null
make > /dev/null
cd ../../perf

perf record --call-graph dwarf ../visual/build/graph
perf script -i perf.data > perf.folded

cd FlameGraph
./stackcollapse-perf.pl < ../perf.folded > ../perf.collapsed
./flamegraph.pl ../perf.collapsed > ../flamegraph.svg
cd ..

rm -rf ../visual/build
rm perf.folded
rm perf.collapsed
rm perf.data

