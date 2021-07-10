#include <stdio.h>
#include <stdint.h>

extern  void reverseString ( char strOut[], const char strIn[]);

#define count 50
int main()
{

	char str[count];
	scanf("%s",&str);
	char out[count];
	reverseString (out,str);
	printf("%s",out);


}
