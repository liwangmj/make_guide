@echo off

rd /s /q %~dp0..\..\build\cmake_win32_x86_gcc_debug
md %~dp0..\..\build\cmake_win32_x86_gcc_debug\
cd %~dp0..\..\build\cmake_win32_x86_gcc_debug\

cmake -DCPLATFORM=win32 -DCCPU=x86 -DCCOMPILE=gcc -DCVER=debug -DBUILD_TESTS=ON -G"MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=mingw32-gcc.exe -DCMAKE_CXX_COMPILER=mingw32-g++.exe -DCMAKE_MAKE_PROGRAM=mingw32-make.exe ..\..\cmake
make -j8

cd ..
pause

exit /b 0
