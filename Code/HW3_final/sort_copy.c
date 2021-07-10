#include <stdio.h>
#include <stdint.h>

extern void sortAscendingCopy (uint32_t y[], const uint32_t x[],uint32_t count);


#define count 6
int main()
{
	uint32_t og[count];
	uint32_t i=0;
//	for(i=0;i<count;i++)
//	{
//	scanf("%u",&og[i]);
//	}

og[0]=54 ;
og[1]=55 ;
og[2]=43 ;
og[3]=33 ;
og[4]=99 ;
og[5]=11 ;


	uint32_t n[count];


//	 for(i=0;i<count;i++)
  //      {
 //                printf("og :%u\n",og[i]);
//         }

	sortAscendingCopy(n,og,count);


	for(i=0;i<count;i++)
        {
       		 printf("%u\n",n[i]);
 	 }


}
