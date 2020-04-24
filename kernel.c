#include <stdio.h>
#include <immintrin.h>
void baseline(unsigned n, double * a, unsigned * ind, double * b, double * c){
	unsigned i,j;
	for(j=0;j<n;j++){
		for(i=0;i<n;i++){
			c[i*n+j]=a[ind[j]]/b[i];
		}
	}
}

//Optimisation de la division
void opt_div(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j;

	for(j=0;j<n;j++){
		for(i=0;i<n;i++){
			c[i*n+j]=a[ind[j]]* (1/b[i]);
		}
	}
}

//Calcul de ind[j] avant la deuxieme boucle
void opt_invariant(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j,tmp;

	for(j=0;j<n;j++){

		tmp = ind[j];

		for(i=0;i<n;i++){

			c[i*n+j]=a[tmp]* (1/b[i]);
		}
	}
}

//Ne plus parcourir colonne par colonne mais ligne par ligne
void opt_inversion(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j;

	for (i=0;i<n;i++){

    	for(j=0;j<n;j++){

        	c[i*n+j]=a[ind[j]]*(1/b[i]);
    	}
	}
}

//Pareil mais avec calcul de i*n avant
void opt_invariant2(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j,tmp=0;
	double tmp2 = 0;

	for (i=0;i<n;i++){
		tmp = i*n;
		tmp2 = b[i];
    	for(j=0;j<n;j++){
        	c[tmp+j]=a[ind[j]]*(1/tmp2);

    	}
	}
}
//Oneloop
void opt_loop(unsigned n, double *restrict  a, unsigned *restrict  ind, double *restrict  b, double *restrict  c){
    unsigned n2=n*n;
    for(unsigned i = 0 ; i < n2 ; i++){
        c[i]=a[ind[i/n]]/b[i%n];
    }
}


void opt_intrinsic(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j,tmp,tmp3;
	__m256d tmp2 = _mm256_setzero_pd ();
	for (i=0;i<n;i++){
		tmp = (i*n);
		tmp2 = _mm256_set1_pd(b[i]);
    	for(j=0;j<n;j++){
					tmp3 = ind[j];
        	c[tmp+j]= _mm256_cvtsd_f64(_mm256_mul_pd(_mm256_set1_pd(a[tmp3]),_mm256_div_pd( _mm256_set1_pd(1.0),tmp2)));
    	}
	}
}
