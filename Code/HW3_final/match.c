#include <stdio.h>
#include <stdint.h>

extern uint32_t  match(const uint32_t x[], uint32_t  match, uint32_t  count);

#define count 6
int main()
{
	uint32_t  i,m;
	uint32_t array[count];

	for(i=0;i<count;i++)
	{
		printf("enter  x[%u]",i);
		scanf("%u",&array[i]);
	}
	printf("match with");
	scanf("%u",&m);


	printf("%u",match(array,m,count));
}
