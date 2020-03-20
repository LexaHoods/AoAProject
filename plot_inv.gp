set term png size 1900,1000

set grid

set ylabel "Cycles par nombre d'opérations"
set xlabel "n itérations"

set title "Courbe warmup"

plot "perf.csv" w lp
