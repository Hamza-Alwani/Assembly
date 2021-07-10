#include <stdio.h>
#include <stdint.h>

extern uint32_t max(const uint32_t x[],uint32_t count);

#define count 6
int main()
{
	uint32_t temp=0;
	uint32_t array[count];

	for(temp=0;temp<count;temp++)
	{
		scanf("%u",&array[temp]);
	}

	printf("%u",max(array,count));



}
