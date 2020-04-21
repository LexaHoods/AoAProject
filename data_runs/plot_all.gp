set term png size 1900,1000

set grid

set ylabel "Cycles par nombre d'opérations"
set xlabel "n itérations"

set yrange[0:10]
#set autoscale y

set multiplot layout 3,2 rowsfirst

set title "O1 compiler optimization"
plot "O1/data/baseline" w lp t "Baseline" , "O1/data/opt_div" w lp t "opt_div", "O1/data/opt_invariant" w lp t "opt_invariant", "O1/data/opt_invariant2" w lp t "opt_invariant2", "O1/data/opt_inversion" w lp t "opt_inversion"

set title "O2 compiler optimization"
plot "O2/data/baseline" w lp t "Baseline", "O2/data/opt_div" w lp t "opt_div", "O2/data/opt_invariant" w lp t "opt_invariant", "O2/data/opt_invariant2" w lp t "opt_invariant2", "O2/data/opt_inversion" w lp t "opt_inversion"

set title "O3 compiler optimization"
plot "O3/data/baseline" w lp t "Baseline", "O3/data/opt_div" w lp t "opt_div", "O3/data/opt_invariant" w lp t "opt_invariant", "O3/data/opt_invariant2" w lp t "opt_invariant2", "O3/data/opt_inversion" w lp t "opt_inversion"

set title "Ofast compiler optimization"
plot "Ofast/data/baseline" w lp t "Baseline", "Ofast/data/opt_div" w lp t "opt_div", "Ofast/data/opt_invariant" w lp t "opt_invariant", "Ofast/data/opt_invariant2" w lp t "opt_invariant2", "Ofast/data/opt_inversion" w lp t "opt_inversion"

set title "Os compiler optimization"
plot "Os/data/baseline" w lp t "Baseline", "Os/data/opt_div" w lp t "opt_div", "Os/data/opt_invariant" w lp t "opt_invariant", "Os/data/opt_invariant2" w lp t "opt_invariant2", "Os/data/opt_inversion" w lp t "opt_inversion"

unset multiplot
