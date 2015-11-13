Qt helloworld
==============

#### What's this? ####

The project is Qt's helloworld code. using CMake to build project.

Learn & Download Qt:

```
    http://qt-project.org/
```

Generate Solutions
==============

Now, we support Windows & Mac OS X platforms (which means you cannot build it on Linux, like Ubuntu).

Supported IDE (verified): Microsoft Vistual Studio 2013 / Apple XCode 6

Learn & Download CMake :

```
    http://www.cmake.org
```

###STEP01

Clone project, set **WHRER IS SOURCE CODE** path and **WHRER TO BUILD THE BINARIES** path in cmake.

Click **Configure** and create binaries folder.

###STEP02 

Then you can see a error information. 

Find you Qt Kit path, copy the path and to set cmake variable **QT_KIT_PATH**.

(For example : F:\Qt\Qt5.3.1\5.3\msvc2013_64_opengl or /Applications/Qt5.3.2/5.3/clang_64)

Click **Configure** again.

On **Windows** you can find **COPY_QT_DLL_FILS** and **COPY_DEBUG_DLL** variable.

Select **COPY_QT_DLL_FILS** will to copy needed DLL files (Like Qt5Core.dll Qt5Gui.dll ...) when you click **Configure**.

If select **COPY_DEBUG_DLL** will to copy DEBUG version DLL files.

###STEP03

Click **Generating** to generate solutions.

![preview](https://raw.githubusercontent.com/frimin/qt-helloworld-cmake-template/master/img/build_in_xcode.png "preview")

How to process MOC & UIC
==============

Add files to the following code (in src\CMakeLists.txt) to process MOC (Meta-Object Compiler) and UIC (User Interface Compiler). 

    SET(DO_MOC_HEADER_LIST
        mainwindow.h
    )

    SET(DO_UIC_LIST
        mainwindow.ui
    )

License
============== 
No license
