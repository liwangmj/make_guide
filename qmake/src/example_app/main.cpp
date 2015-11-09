#include <stdio.h>
#include <QApplication>

#include "example_lib.h"
#include "example_dll.h"

#include "module_a/module_a.h"
#include "module_b/module_b.h"

#include "mainwindow.h"

int main(int argc, char *argv[])
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

    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    return a.exec();
}
