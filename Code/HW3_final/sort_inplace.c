
#include <stdio.h>
#include <stdint.h>

extern void sortAscendingInPlace(uint32_t x[], uint32_t count);

#define count 6
int main()
{

        uint32_t array[count];
        uint32_t i;
//      for(i=0;i<count;i++)
//      {
//              printf(" enter x[%u]",i);
//              scanf("%u",&array[i]);
//      }
array[0]=66;
array[1]=53;
array[2]=444;
array[3]=321;
array[4]=23;
array[5]=11231;

          sortAscendingInPlace(array, count);
         for(i=0;i<count;i++)
        {
                printf(" x[%u] : %u\n",i,array[i]);
        }

}

