#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "rdtsc.h"
#include <time.h>
#include <emmintrin.h>
#include "kernel.h"
#include "common.h"
#define NB_METAS 31


void init_tab(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j;
	for(i=0;i<n;i++){
		a[i]=rand();
		ind[i]=rand()%n;
		b[i]=rand()+1;
		for(j=0;j<n;j++){
			c[i*n+j]=0;
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
  u64 samples_count = 0;
  u64 cycles[NB_METAS], cycles_a, cycles_b;

	int i, m;
	FILE* fichier = fopen("perf.csv", "w");

	/* get command line arguments */
	int size = atoi (argv[1]); /* matrix size */
	int repw = atoi (argv[2]); /* repetition number */
	int repm = atoi (argv[3]); /* repetition number */

	for (m=0; m<NB_METAS; m++) {
		/* allocate arrays */
		unsigned *restrict ind = _mm_malloc (size * sizeof(unsigned),64);
		double  *restrict a = _mm_malloc (size * sizeof(double),64);
		double  *restrict b = _mm_malloc (size * sizeof(double),64);
		double  *restrict c = _mm_malloc (size * size * sizeof(double),64);

		/* init arrays */
		srand(0);
		init_tab(size,a,ind,b,c);

		/* warmup (repw repetitions in first meta, 1 repet in next metas) */
		t1 = clock();
		if (m == 0) {
			for (i=0; i<repw; i++){
			 #if BASELINE
					baseline(size,a,ind,b,c);
			 #elif OPTDIV
			 		opt_div(size,a,ind,b,c);
			 #elif OPTINVA
					opt_invariant(size,a,ind,b,c);
			 #elif OPTINVA2
					opt_invariant2(size,a,ind,b,c);
			 #elif OPTINV
					opt_inversion(size,a,ind,b,c);
			#elif OPTLOOP
				 opt_loop(size,a,ind,b,c);
			#elif OPTINTRINSIC
		 		 opt_intrinsic(size,a,ind,b,c);
			#endif
			}
		} else {
			#if BASELINE
				 baseline(size,a,ind,b,c);
			#elif OPTDIV
				opt_div(size,a,ind,b,c);
			#elif OPTINVA
				opt_invariant(size,a,ind,b,c);
			#elif OPTINVA2
				opt_invariant2(size,a,ind,b,c);
			#elif OPTINV
				opt_inversion(size,a,ind,b,c);
			#elif OPTLOOP
				opt_loop(size,a,ind,b,c);
			#elif OPTINTRINSIC
				 opt_intrinsic(size,a,ind,b,c);
		 #endif
		}
		t2 = clock();
		temps = (float)(t2-t1)/CLOCKS_PER_SEC;
		//printf("temps = %f\n", temps);

		/* measure repm repetitions */
		cycles_a = rdtsc();
		for (i=0; i<repm; i++){
		 #if BASELINE
				 baseline(size,a,ind,b,c);
		 #elif OPTDIV
				opt_div(size,a,ind,b,c);
		 #elif OPTINVA
				opt_invariant(size,a,ind,b,c);
		 #elif OPTINVA2
				opt_invariant2(size,a,ind,b,c);
		 #elif OPTINV
				opt_inversion(size,a,ind,b,c);
		 #elif OPTLOOP
			 opt_loop(size,a,ind,b,c);
		 #elif OPTINTRINSIC
				opt_intrinsic(size,a,ind,b,c);
		 #endif
		}

		cycles_b = rdtsc();

		u64 elapsed = (cycles_b - cycles_a);
		if (samples_count < NB_METAS)
      cycles[samples_count++] = elapsed;
		/* print performance */
		fprintf (stdout,"%5d; %.8f;\n",m, elapsed / ((float) repm*size*size));

		/* free arrays */
		_mm_free (ind);
		_mm_free (a);
		_mm_free (b);
		_mm_free (c);
	}

	sort(cycles, samples_count);

	//
	f64 min, max, avg, mea, dev, bpc;

	//
	mea = mean(cycles, samples_count);

	//
	dev = stddev(cycles, samples_count);

	//
	min = cycles[0];
	max = cycles[samples_count - 1];
	avg = (min + max) / 2.0;

	//
	bpc = ((float) repm*size*size)/ mea;

	//
	fprintf(stderr, "\n     %15.3lf; %15.3lf; %15.3lf; %15.3lf; %15.3lf; %15.3lf %%;\n",
	min,
	max,
	avg,
	mea, //moyenne arithmetique
	bpc,
	(dev * 100.0 / mea));

	fclose(fichier);
	return EXIT_SUCCESS;
}
