#include <stdio.h>
#include <stdint.h>

extern uint32_t isEvenParity(uint32_t x);

int main()
{

	uint32_t a= 256;
	printf("%u",isEvenParity(a));
}
