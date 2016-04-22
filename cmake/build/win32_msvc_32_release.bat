@echo off

rd /s /q %~dp0..\..\build\cmake_win32_msvc_32_release
md %~dp0..\..\build\cmake_win32_msvc_32_release\
cd %~dp0..\..\build\cmake_win32_msvc_32_release\

cmake -DCVER=release -DCCPU=32 -DCCOMPILE=msvc -DCPLATFORM=win32 -G"Visual Studio 10" ..\..\cmake

cd ..
pause

exit /b 0
