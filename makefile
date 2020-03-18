all:
	gcc -O3 -march=native projet.c -o projet -lm
	icc -O3 -xHost projet.c -o projeticc -lm

clean:
	rm -rf *.o
