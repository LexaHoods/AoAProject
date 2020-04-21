CC = gcc
# ICC = icc
CFLAGS= -g3 -march=native
OFLAGS=


baseline:
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelgcc.o -lm -c
	$(CC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commongcc.o -lm -c
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projetgcc.o -c
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projetgcc.o kernelgcc.o commongcc.o -o projetgcc -lm
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) kernel.c -o kernelicc.o -lm -c
	# $(ICC)  $(CFLAGS) -$(O) $(OFLAGS) common.c -o commonicc.o -lm -c
	# $(ICC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projet3.c -o projeticc.o -c
	# $(ICC) -DBASELINE=1 $(CFLAGS) -$(O) $(OFLAGS) projeticc.o kernelicc.o commonicc.o -o projeticc -lm



clean:
	rm -rf *.o *~ projetgcc projeticc
