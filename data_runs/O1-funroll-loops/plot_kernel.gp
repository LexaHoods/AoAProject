set term png size 1900,1000

set grid

#set yrange[0:10]
set autoscale y
set ylabel "Latence en cycles"
set xlabel "n itérations"

set title "Comparison between different implementaions of the kernel"

plot "data/baseline" w lp t "Baseline","data/opt_inversion" w lp t "opt_inversion","data/opt_invariant2" w lp t "opt_invariant2","data/opt_intrinsic" w lp t "opt_intrinsic", "data/opt_opmp" w lp t "opt_opmp"
