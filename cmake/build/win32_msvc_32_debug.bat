@echo off

rd /s /q %~dp0..\..\build\cmake_win32_msvc_32_debug
md %~dp0..\..\build\cmake_win32_msvc_32_debug\
cd %~dp0..\..\build\cmake_win32_msvc_32_debug\

cmake -D CVER=debug -D CCPU=32 -D CCOMPILE=msvc -D CPLATFORM=win32 -G "Visual Studio 10" ..\..\cmake
devenv cmake.sln /rebuild "Debug|Win32"
::xcopy E:\SourceCode\bin\linux_g++_64\debug E:\SourceCode\eclipse\app_bin\dnsserver /s /e /y

cd ..
pause

exit /b 0
