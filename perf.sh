#!/usr/bin/env bash

sudo cpupower -c 0-3 frequency-set -u 4.1GHz
make
taskset -c 1 ./projet $1 $2 $3
./plot.sh projet.png
xdg-open projet.png
# echo "projeticc :"
# taskset -c 1 ./projeticc $1 $2 $3
# ./plot.sh projeticc.png
# xdg-open projeticc.png
# sudo maqao oneview --create-report=one binary=projet run_command="<binary> $1 $2 $3" pinning_command="taskset -c 1"
# sudo maqao oneview --create-report=one binary=projeticc run_command="<binary> $1 $2 $3" pinning_command="taskset -c 1"
#
#
# echo "Likwid cache L3 projet :"
# sudo likwid-perfctr -g L3 taskset -c 1 ./projet $1 $2 $3
# echo "Likwid cache L3 projeticc :"
# sudo likwid-perfctr -g L3 taskset -c 1 ./projeticc $1 $2 $3
