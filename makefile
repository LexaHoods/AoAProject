all:
	gcc -O3 -funroll-loops -ffast-math projet2.c -o projet -lm
	icc -O3 -xHost projet2.c -o projeticc -lm

clean:
	rm -rf *.o


#Pas mal : -fno-ira-share-spill-slots
#-freschedule-modulo-scheduled-loops
#No better: -march=native -finline-functions -funswitch-loops

#-freschedule-modulo-scheduled-loops
#-fsel-sched-pipelining
#-O3 -fno-inline-functions -fno-unswitch-loops -fno-predictive-commoning -fno-gcse-after-reload -fno-tree-vectorize -fno-ipa-cp-clone 818 kb
