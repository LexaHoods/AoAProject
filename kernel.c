#include <stdio.h>
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

        	c[i*n+j]=a[ind[j]]/b[i];
    	}
	}
}

//Pareil mais avec calcul de i*n avant
void opt_invariant2(unsigned n, double *restrict a, unsigned *restrict ind, double *restrict b, double *restrict c){
	unsigned i,j,tmp=0;

	for (i=0;i<n;i++){

		tmp = i*n;

    	for(j=0;j<n;j++){

        	c[tmp+j]=a[ind[j]]/b[i];
					fprintf(stderr, "c1 = %f\n",c[tmp+j]);
					sleep(1);
    	}
	}
}
