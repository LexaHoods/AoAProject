CC = gcc
# ICC = icc
CFLAGS= -g3 -march=native
OFLAGS= -mavx2


baseline:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm

opt_div:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm
opt_invariant:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTINVA=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTINVA=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm
opt_invariant2:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTINVA2=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTINVA2=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm
opt_inversion:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTINV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTINV=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm

opt_loop:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTLOOP=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTLOOP=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm
opt_intrinsic:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTINTRINSIC=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTINTRINSIC=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm
opt_unrolling:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DOPTUNROLLING=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DOPTUNROLLING=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DOPTDIV=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm

clean:
	rm -rf *.o *~ projetgcc projeticc
