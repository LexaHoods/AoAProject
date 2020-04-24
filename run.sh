#!/bin/bash


#
gnuplot --version >> "/dev/null"

if [ $? -ne 0 ]
then
    echo "Error: Cannot invoke GNUPLOT"
    exit 1
fi

if [ $# -eq 0 ]
then
    echo " launch with ./run [size] [nombre de warmup] [nombre de repets]"
    exit 1
fi
#
echo -e "[BEGIN]\n"

#
dir="data_runs"
mkdir -p $dir $dir"/logs"

#
cp "plot_all.gp" $dir
#Compiler optimizations
#GCC compilation:"O1 -funroll-loops -ftree-loop-vectorize " "O2 -funroll-loops -ftree-loop-vectorize " "O3 -funroll-loops " "Ofast -funroll-loops" "Os"
for opt in  "O1" "O2" "O3" "Ofast" "Os"

do
    #
    name=` echo $opt| sed -e " s/\ //g" `
    echo "Running with flag: "$opt

    #
    mkdir -p $dir"/"$name
    mkdir -p $dir"/"$name"/data"

    #
    cp "plot_kernel.gp" $dir"/"$name
    #Going through kernel code variants
    for variant in baseline opt_invariant2 opt_inversion opt_intrinsic
    do
    	#
    	echo -e "\tVariant: "$variant

    	#Compile variant
    	make $variant O="$opt" >> $dir"/logs/compile.log" 2>> $dir"/logs/compile_err.log"

    	#Run & select run number & cycles
      #perf stat ./sobel in/input.raw sout/output.raw 2>> "perfstat.txt" | cut -d';' -f1,3 > $dir"/"$name"/data/"$variant
      #sudo maqao oneview --create-report=one binary=projetgcc run_command="<binary> $1 $2 $3" pinning_command="taskset -c 1"
      # sudo likwid-perfctr -g L3 taskset -c 1 ./projetgcc $1 $2 $3
    	./projetgcc $1 $2 $3 | cut -d';' -f1,2 > $dir"/"$name"/data/"$variant
    	echo
    done

    #
    cd $dir"/"$name

    #Generate the plot
    gnuplot -c "plot_kernel.gp" > "plot_"$name".png"
    cd ../..

    echo
done

#
cd $dir

gnuplot -c "plot_all.gp" > "plot_all.png"
cd ..

#
make clean

#
echo -e "\n[DONE]"
