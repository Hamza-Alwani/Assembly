#include <stdint.h>

#include <stdio.h>


extern int32_t decimalToInt32(const char str[]);


#define size 6
int main()
{

	char  a[size];

	scanf("%s",&a);


	printf("%d",decimalToInt32(a));

}
