#!/usr/bin/bash

set -xe

valgrind --tool=memcheck $@ --log-file="$(date +%s).memcheck.out" ../visual/build/graph


