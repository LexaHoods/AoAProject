#!/usr/bin/env bash

sudo cpupower -c 0-3 frequency-set -u 4.1GHz
make
taskset -c 1 ./projet $1 $2 $3
./plot.sh projet.png
taskset -c 1 ./projeticc $1 $2 $3
./plot.sh projeticc.png

sudo maqao oneview --create-report=one binary=projet run_command="<binary> $1 $2 $3" pinning_command="taskset -c 1"
sudo maqao oneview --create-report=one binary=projeticc run_command="<binary> $1 $2 $3" pinning_command="taskset -c 1"
