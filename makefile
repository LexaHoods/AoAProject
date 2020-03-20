all:
	gcc -O2 projet2.c -o projet -lm
	icc -O2 projet2.c -o projeticc -lm

clean:
	rm -rf *.o
