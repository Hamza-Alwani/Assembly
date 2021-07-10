#include <stdint.h>
#include <stdio.h>
#include <string.h>


#define MAX_NAME_LENGTH 32

#define PACK
#ifdef PACK
# pragma pack(push)
#pragma pack(1)
#endif

typedef struct _BUSINESS {
    uint32_t taxId;			//4
    char name[MAX_NAME_LENGTH+1];	//33
    uint32_t addNo;			//4
    char direction;			//1
    char street[MAX_NAME_LENGTH+1];	//33
    char city[MAX_NAME_LENGTH+1];	//33
    char state[2+1];			//3
    uint32_t zip;			//4
} BUSINESS;				//115
#ifdef PACK
#pragma pack(pop)
#endif


extern uint32_t findName(const  BUSINESS  business[], uint32_t count, char name[]);

#define COUNT 3

int main()
{
    uint32_t i;
    BUSINESS business[COUNT] = {
        {12342332, "Home", 201, 'W', "Road to Six Flags", "Arlington", "TX", 76011},
        {18091123, "Kroger", 945, 'W', "Lamar Blvd", "Arlington", "TX", 76012},
        {81927322, "Round1", 3811, 'S', "Cooper St", "Arlington", "TX", 76015} };
//    printf("Addresses of selected record entries:\r\n");
//   char format[] = {"%08x %s\r\n"};
//  printf(format, &business[0], "business[0]");
//    printf(format, &business[0].taxId, "taxId");
//    printf(format, &business[0].name, "name");
//    printf(format, &business[0].addNo, "addNo");
//    printf(format, &business[0].direction, "direction");
//    printf(format, &business[0].street, "street");
//    printf(format, &business[0].city, "city");
//    printf(format, &business[0].state, "state");
//    printf(format, &business[0].zip, "zip");
//    printf(format, &business[1], "business[1]");
//    printf(format, &business[2], "business[2]");
//    printf("\r\n");
//    printf("Record number: ");
//    scanf("%u", &i);

	printf("Index  = %u	\r\n", findName(business,COUNT, "Home"));
	printf("Index  = %u     \r\n", findName(business,i, "Kroger"));
	printf("Index  = %u     \r\n", findName(business,i, "Round1"));

//
//	printf("Index  = %u \r\n", findName(business,i, "Kroger"));
//	printf("Index  = %u \r\n", findName(business,i, "YEET"));


//    printf("ZIP = %u\r\n", getZip(business, i));
    return 0;
}
