#include <stdint.h>
#include <stdio.h>

extern uint32_t bro(uint32_t x);


int main()
{

	uint32_t a=255;
	uint32_t y= bro(a);
	printf("%u\n",y);

}
