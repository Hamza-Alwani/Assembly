#include <stdint.h>
#include <stdio.h>
#include <string.h>

extern uint32_t match (char a[], char b[]);

int main()
{
	char a[3]= "ab";
	char b[3]= "ab";

	printf("%u",match(a,b));
	return 0;
}
