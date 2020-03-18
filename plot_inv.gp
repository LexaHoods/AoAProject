set term png size 1900,1000

set grid

set ylabel "Cycles"
set xlabel "n"

set title "Test"

plot "perf.csv" w lp
