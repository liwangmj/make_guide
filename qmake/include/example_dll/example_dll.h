#ifndef _INCLUDE_EXAMPLE_DLL_EXAMPLE_DLL_H
#define _INCLUDE_EXAMPLE_DLL_EXAMPLE_DLL_H

#include <QtCore/qglobal.h>

#if defined(QT_DLL_LIBRARY)
#  define QT_DLL_SHARED_EXPORT Q_DECL_EXPORT
#else
#  define QT_DLL_SHARED_EXPORT Q_DECL_IMPORT
#endif

#ifdef __cplusplus
extern "C" {
#endif

QT_DLL_SHARED_EXPORT int example_dll_test();

class QT_DLL_SHARED_EXPORT Example_dll
{
public:
    Example_dll();
};

#ifdef __cplusplus
}
#endif

#endif /* _INCLUDE_EXAMPLE_DLL_EXAMPLE_DLL_H */
