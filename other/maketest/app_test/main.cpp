#include	<stdio.h>

extern "C"
{
#include "foo.h"
#include "bar.h"
}

extern void foo(int a);

int main()
{
	foo();
	bar();
	return 0;
}
