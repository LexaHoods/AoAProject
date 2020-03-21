set term png size 1900,1000

set grid
set yrange[0:0.01]
set ylabel "Cycles par nombre d'opérations"
set xlabel "n itérations"

set title "Courbe warmup"

plot "perf.csv" w lp
