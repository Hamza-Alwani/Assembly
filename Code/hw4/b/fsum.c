#include <stdint.h>
#include <stdio.h>


extern double fsum (const double x[], uint32_t count);

#define  count 5

int main()
{
	double x[count]={100.5,200.4,1.5,67.99,	99.00};

	printf("%lf",fsum(x,count));
}
