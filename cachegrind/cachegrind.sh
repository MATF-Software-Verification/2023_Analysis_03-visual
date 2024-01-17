#!/usr/bin/bash

set -xe

valgrind --tool=cachegrind --log-file="cachegrind-%p-%n.dat" ../visual/build/graph

latest_file=$(ls -t cachegrind.out.* | head -n1)
cg_annotate "$latest_file" > "$latest_file.txt"


