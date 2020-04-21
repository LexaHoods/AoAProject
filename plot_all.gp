set term png size 1900,1000

set grid

set ylabel "Cycles par nombre d'opérations"
set xlabel "n itérations"

set yrange[0:10]
#set autoscale y

set multiplot layout 3,2 rowsfirst

set title "O1 compiler optimization"
plot "O1/data/baseline" w lp t "Baseline"

set title "O2 compiler optimization"
plot "O2/data/baseline" w lp t "Baseline"

set title "O3 compiler optimization"
plot "O3/data/baseline" w lp t "Baseline"

set title "Ofast compiler optimization"
plot "Ofast/data/baseline" w lp t "Baseline"

set title "Os compiler optimization"
plot "Os/data/baseline" w lp t "Baseline"

unset multiplot
