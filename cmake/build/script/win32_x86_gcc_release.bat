@echo off

rd /s /q %~dp0..\..\..\build\cmake_win32_x86_gcc_release
md %~dp0..\..\..\build\cmake_win32_x86_gcc_release\
cd %~dp0..\..\..\build\cmake_win32_x86_gcc_release\

cmake -DCPLATFORM=win32 -DCCPU=x86 -DCCOMPILE=gcc -DCVER=release -G"MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=mingw32-gcc.exe -DCMAKE_CXX_COMPILER=mingw32-g++.exe -DCMAKE_MAKE_PROGRAM=mingw32-make.exe ..\..\cmake
make -j8

cd ..
pause

exit /b 0
