@echo off

rd /s /q %~dp0..\..\build\cmake_win32_msvc_32_release
md %~dp0..\..\build\cmake_win32_msvc_32_release\
cd %~dp0..\..\build\cmake_win32_msvc_32_release\

cmake -D CVER=release -D CCPU=32 -D CCOMPILE=msvc -D CPLATFORM=win32 -G "Visual Studio 10" ..\..\cmake
devenv cmake.sln /rebuild "Release|Win32"
::xcopy E:\SourceCode\bin\linux_g++_64\debug E:\SourceCode\eclipse\app_bin\dnsserver /s /e /y

cd ..
pause

exit /b 0
