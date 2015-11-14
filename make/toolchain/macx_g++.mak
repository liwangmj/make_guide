export DYLD_LIBRARY_PATH=${APPOUTPATH}

CCACHE := ccache
OBJCOPY := objcopy
BEAR := bear
CC := g++
CXX := g++
AR := ar
LD := ld
RM := rm -f
ARFLAGS := rcs
LDFLAGS := -lm
CFLAGS := -fPIC
CXXFLAGS := -fPIC

ifeq ($(CVER), debug)
    APPOUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}_d
    LIBOUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}_d.a
    DLLOUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}_d.so
    LDFLAGS += -Wl,-rpath=${APPOUTPATH}:${LIBOUTPATH}:${DLLOUTPATH}
    CFLAGS += -g -D__DEBUG
    CXXFLAGS += -g -D__DEBUG
    
    ifeq ($(CCPU), 64)
        CFLAGS += -m64 -D__MACX_GXX_64
        CXXFLAGS += -m64 -D__MACX_GXX_64
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${APPOUTSUFFIX}

    else ifeq ($(CCPU), 32)
        CFLAGS += -m32 -D__MACX_GXX_32
        CXXFLAGS += -m32 -D__MACX_GXX_32
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${APPOUTSUFFIX}
    endif

else
    APPOUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}
    LIBOUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}.a
    DLLOUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}.so
    LDFLAGS += -Wl,-rpath=./:./lib:./plugin
    CFLAGS += -O3 -Wall
    CXXFLAGS += -O3 -Wall
    
    ifeq ($(CCPU), 64)
        CFLAGS += -m64 -D__MACX_GXX_64
        CXXFLAGS += -m64 -D__MACX_GXX_64
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${APPOUTSUFFIX}

    else ifeq ($(CCPU), 32)
        CFLAGS += -m32 -D__MACX_GXX_32
        CXXFLAGS += -m32 -D__MACX_GXX_32
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${APPOUTSUFFIX}
    endif
endif
