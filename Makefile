CC = gcc
CFLAGS= -g3
OFLAGS= -mavx2 -march=native -fopenmp 


baseline:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm

opt_div:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm

opt_invariant:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTINVA=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTINVA=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm

opt_invariant2:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTINVA2=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTINVA2=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm

opt_inversion:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTINV=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTINV=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm


opt_loop:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTLOOP=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTLOOP=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm

opt_intrinsic:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTINTRINSIC=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTINTRINSIC=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm

opt_opmp:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernel.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o common.o -lm -c
	$(CC) -DOPTOPMP=1 $(CFLAGS) -$(O) $(OFLAGS) projet.c -o projet.o -c
	$(CC) -DOPTOPMP=1 $(CFLAGS) -$(O) $(OFLAGS) projet.o kernel.o common.o -o projet -lm


clean:
	rm -rf *.o *~ projet
