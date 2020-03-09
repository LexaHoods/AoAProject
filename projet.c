#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "rdtsc.h"

void baseline(unsigned n, double a[n], unsigned ind[n], double b[n], double c[n][n]){
    unsigned i,j;
    for(j=0;j<n;j++){
        for(i=0;i<n;i++){
            c[i][j]=a[ind[j]]/b[i];
        }
    }
}

void init_tab(unsigned n, double a[n], unsigned ind[n], double b[n], double c[n][n]){
    unsigned i,j;
    for(i=0;i<n;i++){
        a[i]=rand();
        ind[i]=rand()%n;
        b[i]=rand();
        for(j=0;j<n;j++){
            c[i][j]=0;
        }
    }
}

int main(){
    srand(0);
    unsigned n=100;
    double a[n], b[n], c[n][n];
    unsigned ind[n]; 
    
    unsigned cycles_a,cycles_b;
    
    init_tab(n,a,ind,b,c);
    
    cycles_b = rdtsc();
    baseline(n,a,ind,b,c);
    cycles_a = rdtsc();
    
    printf("%d\n",cycles_a-cycles_b);
}
