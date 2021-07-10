#include <stdint.h>
#include <stdio.h>

extern uint32_t hexToUint32(const char str[]);

#define  size 6
int main()
{
	char arr[size];
	scanf("%s",&arr);

	uint32_t x=hexToUint32(arr);
	printf("%u",x);

}
