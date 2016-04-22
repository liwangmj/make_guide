@echo off

rd /s /q %~dp0..\..\build\cmake_win32_g++_32_debug
md %~dp0..\..\build\cmake_win32_g++_32_debug\
cd %~dp0..\..\build\cmake_win32_g++_32_debug\

cmake -D CVER=debug -D CCPU=32 -D CCOMPILE=g++ -D CPLATFORM=win32 -G "MinGW Makefiles" -D CMAKE_C_COMPILER=mingw32-gcc.exe -D CMAKE_CXX_COMPILER=mingw32-g++.exe -D CMAKE_MAKE_PROGRAM=mingw32-make.exe ..\..\cmake
make

cd ..
pause

exit /b 0
