set term png size 1900,1000

set grid

set ylabel "Latence en cycles"
set xlabel "n itérations"

#set yrange[0:10]
set autoscale y

set multiplot layout 3,2 rowsfirst

set title "O1 compiler optimization"
plot "O1/data/baseline" w lp t "Baseline" , "O1/data/opt_invariant2" w lp t "opt_invariant2", "O1/data/opt_inversion" w lp t "opt_inversion","O1/data/opt_intrinsic" w lp t "opt_intrinsic", "O1/data/opt_opmp" w lp t "opt_opmp"



set title "O2 compiler optimization"
plot "O2/data/baseline" w lp t "Baseline", "O2/data/opt_invariant2" w lp t "opt_invariant2", "O2/data/opt_inversion" w lp t "opt_inversion","O2/data/opt_intrinsic" w lp t "opt_intrinsic", "O2/data/opt_opmp" w lp t "opt_opmp"


set title "O3 compiler optimization"
plot "O3/data/baseline" w lp t "Baseline", "O3/data/opt_invariant2" w lp t "opt_invariant2", "O3/data/opt_inversion" w lp t "opt_inversion","O3/data/opt_intrinsic" w lp t "opt_intrinsic", "O3/data/opt_opmp" w lp t "opt_opmp"


set title "Ofast compiler optimization"
plot "Ofast/data/baseline" w lp t "Baseline", "Ofast/data/opt_invariant2" w lp t "opt_invariant2", "Ofast/data/opt_inversion" w lp t "opt_inversion","Ofast/data/opt_intrinsic" w lp t "opt_intrinsic", "Ofast/data/opt_opmp" w lp t "opt_opmp"



set title "Os compiler optimization"
plot "Os/data/baseline" w lp t "Baseline", "Os/data/opt_invariant2" w lp t "opt_invariant2", "Os/data/opt_inversion" w lp t "opt_inversion","Os/data/opt_intrinsic" w lp t "opt_intrinsic", "Os/data/opt_opmp" w lp t "opt_opmp"


unset multiplot
