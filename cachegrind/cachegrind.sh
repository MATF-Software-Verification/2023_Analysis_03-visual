#!/usr/bin/bash

mkdir ../visual/build && cd ../visual/build
qmake CONFIG+=debug ../GraphVisual/graph.pro > /dev/null
make > /dev/null
cd ../../cachegrind

valgrind --tool=cachegrind --log-file="cachegrind-%p-%n.dat" ../visual/build/graph

latest_file=$(ls -t cachegrind.out.* | head -n1)
cg_annotate "$latest_file" > "$latest_file.txt"

rm -rf ../visual/build
rm $latest_file
