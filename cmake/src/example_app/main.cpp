#include <stdio.h>

#include "example_lib.h"
#include "example_dll.h"

#include "module_a/module_a.h"
#include "module_b/module_b.h"

int main(int argc, char **argv)
{
#ifdef __DEBUG
    example_lib_test();
    example_dll_test();
    module_a_test();
    module_b_test();

    printf("main debug finished\n");
#else
    example_lib_test();
    example_dll_test();
    module_a_test();
    module_b_test();
    printf("main release finished\n");
#endif
	return 0;	
}
