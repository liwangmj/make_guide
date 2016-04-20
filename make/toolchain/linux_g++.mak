export LD_LIBRARY_PATH=${APPOUTPATH}

CCACHE := ccache
OBJCOPY := objcopy
BEAR := bear
CC := g++
CXX := g++
AR := ar
LD := ld
RM := rm -f
ARFLAGS := -rcs
LDFLAGS := -lm
CFLAGS := -fPIC
CXXFLAGS := -fPIC

LIBSUFFIX = .a
DLLSUFFIX = .so

ifeq ($(CVER), debug)
    OUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}_d
    LDFLAGS += -Wl,-rpath=${APPOUTPATH}:${LIBOUTPATH}:${DLLOUTPATH}
    CFLAGS += -g -D__DEBUG
    CXXFLAGS += -g -D__DEBUG
    
    ifeq ($(CCPU), 64)
        CFLAGS += -m64 -D__LINUX_GXX_64
        CXXFLAGS += -m64 -D__LINUX_GXX_64
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${OUTSUFFIX}

    else ifeq ($(CCPU), 32)
        CFLAGS += -m32 -D__LINUX_GXX_32
        CXXFLAGS += -m32 -D__LINUX_GXX_32
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${OUTSUFFIX}
    endif

else
    OUTSUFFIX := ${CPLATFORM}_${CCOMPILER}_${CCPU}_d
    LDFLAGS += -Wl,-rpath=./:./lib:./plugin
    CFLAGS += -O3 -Wall
    CXXFLAGS += -O3 -Wall
    
    ifeq ($(CCPU), 64)
        CFLAGS += -m64 -D__LINUX_GXX_64
        CXXFLAGS += -m64 -D__LINUX_GXX_64
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${OUTSUFFIX}

    else ifeq ($(CCPU), 32)
        CFLAGS += -m32 -D__LINUX_GXX_32
        CXXFLAGS += -m32 -D__LINUX_GXX_32
        LDFLAGS += ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
        LDFLAGS += -L${DLLOUTPATH} \
                   -lexample_dll_${OUTSUFFIX}
    endif
endif

