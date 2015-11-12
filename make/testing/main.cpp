#include <stdio.h>

#include "example_lib.h"
#include "example_dll.h"

int main(int argc, char **argv)
{
#ifdef __DEBUG
    example_lib_test();
    example_dll_test();
    printf("runtest debug finished\n");
#else
    example_lib_test();
    example_dll_test();
    printf("runtest release finished\n");
#endif
	return 0;	
}
