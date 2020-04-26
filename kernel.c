#include <stdio.h>
#include <immintrin.h>
#include "kernel.h"
#include <omp.h>
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


//Intrinsic and unrolling version
void opt_intrinsic(unsigned n, double *restrict  a, unsigned *restrict ind, double *restrict  b, double *restrict c){
	unsigned i,j;
	__m128i idx = _mm_setzero_si128();
	__m256d ymm0 = _mm256_setzero_pd();

	for(j=0;j<(n & ~0x3);j+=4){
		idx = _mm_load_si128 ((__m128i const *)(ind+j));
		// idx = _mm_setr_epi32(ind[j],ind[j+1],ind[j+2],ind[j+3]);
		ymm0 = _mm256_i32gather_pd(a,idx ,8);
		for(i=0;i<n;i+=4){
			c[i*n+j]=ymm0[0]/b[i];
			c[(i+1)*n+(j+1)]=ymm0[1]*(1/b[i+1]);
			c[(i+2)*n+(j+2)]=ymm0[2]*(1/b[i+2]);
			c[(i+3)*n+(j+3)]=ymm0[3]*(1/b[i+3]);
		}
	}
	for(;i<n;i++){
		c[i*n+j]=a[ind[j]]*(1/b[i]);
	}

}

//Intrinsic and unrolling abd parallel version
void opt_opmp(unsigned n, double *restrict  a, unsigned *restrict ind, double *restrict  b, double *restrict c){
	unsigned i,j;
	__m128i idx ;
	__m256d ymm0;
	#pragma omp parallel for shared(ymm0) private(i,j)
	for(j=0;j<(n & ~0x3);j+=4){
		idx = _mm_load_si128 ((__m128i const *)(ind+j));
		// idx = _mm_setr_epi32(ind[j],ind[j+1],ind[j+2],ind[j+3]);
		ymm0 = _mm256_i32gather_pd(a,idx ,8);
		#pragma omp simd
		for(i=0;i<n;i+=4){
			c[i*n+j]=ymm0[0]/b[i];
			c[(i+1)*n+(j+1)]=ymm0[1]*(1/b[i+1]);
			c[(i+2)*n+(j+2)]=ymm0[2]*(1/b[i+2]);
			c[(i+3)*n+(j+3)]=ymm0[3]*(1/b[i+3]);
		}
	}
	#pragma omp parallel for shared (a)
	for(;i<n;i++){
		c[i*n+j]=a[ind[j]]*(1/b[i]);
	}
}
