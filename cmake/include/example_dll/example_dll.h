/*
 * example_dll.h
 *
 *  Created on: 2015年11月5日
 *      Author: wim
 */

#ifndef _INCLUDE_EXAMPLE_DLL_EXAMPLE_DLL_H
#define _INCLUDE_EXAMPLE_DLL_EXAMPLE_DLL_H

#if defined(__WIN32)
	#if defined(__DLL_LIBRARY)
	#  define DLL_SHARED_EXPORT __declspec(dllexport)
	#else
	#  define DLL_SHARED_EXPORT __declspec(dllimport)
	#endif
#else
	#define DLL_SHARED_EXPORT
#endif

#ifdef __cplusplus
extern "C" {
#endif

DLL_SHARED_EXPORT int example_dll_test();

#ifdef __cplusplus
}
#endif

#endif /* _INCLUDE_EXAMPLE_DLL_EXAMPLE_DLL_H */
