#!/usr/bin/bash

set -xe

mkdir visual/build && cd visual/build
qmake CONFIG+=debug ../GraphVisual/graph.pro > /dev/null
bear -- make > /dev/null
