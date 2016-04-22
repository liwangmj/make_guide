@echo off

rd /s /q %~dp0..\..\build\cmake_win32_msvc_32_debug
md %~dp0..\..\build\cmake_win32_msvc_32_debug\
cd %~dp0..\..\build\cmake_win32_msvc_32_debug\

cmake -DCVER=debug -DCCPU=32 -DCCOMPILE=msvc -DCPLATFORM=win32 -G"Visual Studio 10" ..\..\cmake
devenv cmake.sln /rebuild "Debug|Win32"
::xcopy E:\SourceCode\bin\linux_g++_64\debug E:\SourceCode\eclipse\app_bin\dnsserver /s /e /y

cd ..
pause

exit /b 0
