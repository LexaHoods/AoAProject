set term png size 1900,1000

set grid

set ylabel "Latence en cycles"
set xlabel "n itérations"

#set yrange[0:10]
set autoscale y

set multiplot layout 3,2 rowsfirst

set title "O1-funroll-loops compiler optimization"
plot "O1-funroll-loops/data/baseline" w lp t "Baseline" , "O1-funroll-loops/data/opt_invariant2" w lp t "opt_invariant2", "O1-funroll-loops/data/opt_inversion" w lp t "opt_inversion","O1-funroll-loops/data/opt_intrinsic" w lp t "opt_intrinsic", "O1-funroll-loops/data/opt_opmp" w lp t "opt_opmp"


set title "O2-funroll-loops compiler optimization"
plot "O2-funroll-loops/data/baseline" w lp t "Baseline", "O2-funroll-loops/data/opt_invariant2" w lp t "opt_invariant2", "O2-funroll-loops/data/opt_inversion" w lp t "opt_inversion","O2-funroll-loops/data/opt_intrinsic" w lp t "opt_intrinsic", "O2-funroll-loops/data/opt_opmp" w lp t "opt_opmp"

set title "O3-funroll-loops compiler optimization"
plot "O3-funroll-loops/data/baseline" w lp t "Baseline", "O3-funroll-loops/data/opt_invariant2" w lp t "opt_invariant2", "O3-funroll-loops/data/opt_inversion" w lp t "opt_inversion","O3-funroll-loops/data/opt_intrinsic" w lp t "opt_intrinsic", "O3-funroll-loops/data/opt_opmp" w lp t "opt_opmp"

set title "Ofast-funroll-loops compiler optimization"
plot "Ofast-funroll-loops/data/baseline" w lp t "Baseline", "Ofast-funroll-loops/data/opt_invariant2" w lp t "opt_invariant2", "Ofast-funroll-loops/data/opt_inversion" w lp t "opt_inversion","Ofast-funroll-loops/data/opt_intrinsic" w lp t "opt_intrinsic", "Ofast-funroll-loops/data/opt_opmp" w lp t "opt_opmp"


set title "Os-funroll-loops compiler optimization"
plot "Os-funroll-loops/data/baseline" w lp t "Baseline", "Os-funroll-loops/data/opt_invariant2" w lp t "opt_invariant2", "Os-funroll-loops/data/opt_inversion" w lp t "opt_inversion","Os-funroll-loops/data/opt_intrinsic" w lp t "opt_intrinsic", "Os-funroll-loops/data/opt_opmp" w lp t "opt_opmp"

unset multiplot
