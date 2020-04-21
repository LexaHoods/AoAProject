set term png size 1900,1000

set grid

set yrange[0:10]
#set autoscale y
set ylabel "Cycles par nombre d'opérations"
set xlabel "n itérations"

set title "Comparison between different implementaions of the kernel"

plot "data/baseline" w lp t "Baseline"
