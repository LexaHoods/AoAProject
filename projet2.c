#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "rdtsc.h"
#include <time.h>
#define NB_METAS 31

void baseline(unsigned n, double* a, unsigned *ind, double* b, double ** c){
	unsigned i,j;
	for(j=0;j<n;j++){
		for(i=0;i<n;i++){
			c[i][j]=a[ind[j]]/b[i];
		}
	}
}


void init_tab(unsigned n, double* a, unsigned* ind, double* b, double** c){
	unsigned i,j;
	for(i=0;i<n;i++){
		a[i]=rand();
		ind[i]=rand()%n;
		b[i]=rand()+1;
		for(j=0;j<n;j++){
			c[i][j]=0;
		}
    }
}


int main (int argc, char *argv[]) {
	/* check command line arguments */
	if (argc != 4) {
		fprintf (stderr, "Usage: %s <size> <nb warmup repets> <nb measure repets>\n", argv[0]);
		abort();
	}

	float temps;
  clock_t t1, t2;

	int i, m;
	FILE* fichier = fopen("perf.csv", "w");

	/* get command line arguments */
	int size = atoi (argv[1]); /* matrix size */
	int repw = atoi (argv[2]); /* repetition number */
	int repm = atoi (argv[3]); /* repetition number */

	for (m=0; m<NB_METAS; m++) {
		/* allocate arrays */
		unsigned *ind = (unsigned *)malloc (size * sizeof(unsigned));
		double *a = (double *)malloc (size * sizeof(double));
		double *b = (double *)malloc (size * sizeof(double));
		double **c = (double **)malloc (size * size * sizeof(double*));

		for(i=0;i<size;i++){
			c[i] = (double *) malloc (size  * sizeof(double));
		}

		/* init arrays */
		srand(0);
		init_tab(size,a,ind,b,c);

		/* warmup (repw repetitions in first meta, 1 repet in next metas) */
		t1 = clock();
		if (m == 0) {
			for (i=0; i<repw; i++){
				baseline(size,a,ind,b,c);
			}
		} else {
			baseline(size,a,ind,b,c);
		}
		t2 = clock();
		temps = (float)(t2-t1)/CLOCKS_PER_SEC;
    printf("temps = %f\n", temps);
		/* measure repm repetitions */
		uint64_t t1 = rdtsc();
		for (i=0; i<repm; i++){
			baseline(size,a,ind,b,c);
		}
		uint64_t t2 = rdtsc();

		/* print performance */
		fprintf (fichier,"%5d; %.8f;\n",m,(t2 - t1) / ((float) size * size * size * repm));

		/* print output */
		//if (m == 0) print_array (n, c);

		/* free arrays */
		free (ind);
		free (a);
		free (b);
		for(i=0;i<size;i++){
			free(c[i]);
		}
		free (c);
	}
	fclose(fichier);
	return EXIT_SUCCESS;
}
