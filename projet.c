#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include "rdtsc.h"

#define NB_SAMPLE 20

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
int cmp(const void * a, const void * b){
    return *(unsigned*)a>*(unsigned*)b;
}
double mean(unsigned n, unsigned t[n]){
    unsigned i,total=0;
    for(i=0;i<n;i++){
        total+=t[i];
    }
    return total/(double)n;
}
double stddev(unsigned n,unsigned t[n]){
  double d = 0.0;
  double m = mean(n,t);
  unsigned i;

  //
  for (i=0; i<n; i++)
    d+=(t[i]-m)*(t[i]-m);

  d/=(double)(n-1);

  return sqrt(d);
}


int main(int argc, char **argv){
    srand(0);

    FILE* fichier = fopen("perf.csv", "w");



	unsigned n_ini=0, n_max=800,pas=10,n;
    unsigned cycles_a,cycles_b,cycles[NB_SAMPLE];
    unsigned var_cycle;


	if(argc==4){
        n_ini=atoi(argv[1]);
        n_max=atoi(argv[2]);
        pas=atoi(argv[3]);
    }
    else if(argc==3){
        n_ini=atoi(argv[1]);
        n_max=atoi(argv[2]);
        pas=1;
    }
    else if(argc==2){
        n_ini=atoi(argv[1]);
        n_max=n_ini;
        pas=1;
    }


	double a[n_max], b[n_max], c[n_max][n_max];
    unsigned ind[n_max];

	printf("ok\n");
    fprintf(fichier, "    n;             min;             max;             avg;             mea;             bpc;             dev;\n");

    for(n=n_ini;n<n_max+1;n=n+pas){

        for(var_cycle=0;var_cycle<NB_SAMPLE;var_cycle++){
            init_tab(n,a,ind,b,c);

            cycles_b = rdtsc();
            baseline(n,a,ind,b,c);
            cycles_a = rdtsc();

            cycles[var_cycle]=cycles_a-cycles_b;
            //printf("%d %d\n",var_cycle,cycles_a-cycles_b);

        }
        qsort(cycles, NB_SAMPLE,sizeof(unsigned),cmp);

        double min, max, avg, mea, dev, bpc;

        min = cycles[0];
        max = cycles[NB_SAMPLE-1];
        //avg = (min+max)/2.0;

        //printf("%f %f\n",min,max);

        mea = mean(NB_SAMPLE, cycles);

        //dev = stddev(NB_SAMPLE, cycles);
        //bpc = n / mea;


        fprintf(fichier, "%5u; %15.3f; %15.3f; %15.3f; %15.3f; %15.3f; %15.3f;\n",n,min,max,avg,mea,bpc,(dev*100.0/mea));
    }

    fclose(fichier);
}
