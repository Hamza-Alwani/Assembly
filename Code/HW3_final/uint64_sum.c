#include <stdio.h>
#include <stdint.h>

extern uint64_t  sum(const uint32_t x[],uint32_t count);

#define count 6
int main()
{
	uint32_t temp=0;
	uint32_t array[count];

array[0]=4111111111;
array[2]=1111111111;
array[3]=1111111111;
array[4]=1111111111;
array[5]=1111111111;
array[1]=1111111111;


	uint64_t ans=sum(array,count);
	printf("%llu",ans);
}
