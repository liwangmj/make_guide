@echo off

rd /s /q %~dp0..\..\build\cmake_win32_msvc_32_debug
md %~dp0..\..\build\cmake_win32_msvc_32_debug\
cd %~dp0..\..\build\cmake_win32_msvc_32_debug\

cmake -DCVER=debug -DCCPU=32 -DCCOMPILE=msvc -DCPLATFORM=win32 -G"Visual Studio 10" -DCMAKE_CONFIGURATION_TYPES=debug ..\..\cmake
::devenv ALL_BUILD.vcxproj /rebuild "debug|Win32"
cmake --build .

::xcopy E:\SourceCode\bin\linux_g++_64\debug E:\SourceCode\eclipse\app_bin\dnsserver /s /e /y

cd ..
pause

exit /b 0
