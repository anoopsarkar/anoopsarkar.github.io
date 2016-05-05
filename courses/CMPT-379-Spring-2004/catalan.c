
#include <stdio.h>
#include <stdlib.h>

double fact(double n) { 
  return n ? (n*fact(n-1)) : 1; 
}

double choose(double a, double b) { 
  return fact(a)/(fact(b)*fact(a-b)); 
}

double catalan(double n) { 
  return choose(2*n,n)/(n+1); 
}

int main(int argc, char **argv) {
  double n;
  if (argc < 2) { 
    printf("usage: catalan <number>\n"); 
    return EXIT_FAILURE;
  }
  n = (double)strtol(argv[1], (char **)NULL, 10);
  printf("catalan: %f %f\n", n, catalan(n));
  return EXIT_SUCCESS;
}
