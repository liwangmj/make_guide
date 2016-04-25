@echo off

rd /s /q %~dp0..\..\build\cmake_win32_g++_32_release
md %~dp0..\..\build\cmake_win32_g++_32_release\
cd %~dp0..\..\build\cmake_win32_g++_32_release\

cmake -DCVER=release -DCCPU=32 -DCCOMPILE=g++ -DCPLATFORM=win32 -G"MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=mingw32-gcc.exe -DCMAKE_CXX_COMPILER=mingw32-g++.exe -DCMAKE_MAKE_PROGRAM=mingw32-make.exe ..\..\cmake
::make
cmake --build .

cd ..
pause

exit /b 0
