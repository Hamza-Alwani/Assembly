#include <stdint.h>
#include <stdio.h>


extern void scale (double y[],const double x[],uint32_t scale ,uint32_t count);

#define count 5

int main()
{
	uint32_t  s=2;
	double y[count];
	double x[count]=
	{100.1,
	200.2,
	300.3,
	400.4,
	500.5};
	scale(y,x,s,count);

	uint32_t i=0;
	for(i=0;i<count;i++)
	{
		printf("%llf\n",y[i]);
	}

	return 0;
}
