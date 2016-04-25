@echo off

rd /s /q %~dp0..\..\build\cmake_win32_x86_msvc2010_debug
md %~dp0..\..\build\cmake_win32_x86_msvc2010_debug\
cd %~dp0..\..\build\cmake_win32_x86_msvc2010_debug\

cmake -DCPLATFORM=win32 -DCCPU=x86 -DCCOMPILE=msvc2010 -DCVER=debug -G"Visual Studio 10" -DCMAKE_CONFIGURATION_TYPES=debug ..\..\cmake
devenv ALL_BUILD.vcxproj /rebuild "debug|Win32"

::xcopy E:\SourceCode\bin\linux_g++_64\debug E:\SourceCode\eclipse\app_bin\dnsserver /s /e /y

cd ..
pause

exit /b 0
