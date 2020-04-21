
void baseline(unsigned n, double* a, unsigned *ind, double* b, double* c){
	unsigned i,j;
	for(j=0;j<n;j++){
		for(i=0;i<n;i++){
			c[i*n+j]=a[ind[j]]/b[i];
		}
	}
}