export LD_LIBRARY_PATH=${APPOUTPATH}

CCACHE := ccache
OBJCOPY := objcopy
BEAR := bear
CC := g++
CXX := g++
AR := ar
LD := ld
RM := rm -f
ARFLAGS := -ru
LDFLAGS := -lm
CFLAGS := -m32 -fPIC -D__LINUX
CXXFLAGS := -m32 -fPIC -D__LINUX

LIBSUFFIX = .a
DLLSUFFIX = .so

ifeq ($(CVER), debug)
    OUTSUFFIX := ${CPLATFORM}_${CCPU}_${CCOMPILER}_d
    LDFLAGS += -Wl,-rpath=${APPOUTPATH}:${LIBOUTPATH}:${DLLOUTPATH}
    CFLAGS += -g -D__DEBUG
    CXXFLAGS += -g -D__DEBUG

    LDFLAGS += ${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}
    LDFLAGS += -L${DLLOUTPATH} \
               -lexample_dll_${OUTSUFFIX}

else
    OUTSUFFIX := ${CPLATFORM}_${CCPU}_${CCOMPILER}
    LDFLAGS += -Wl,-rpath=./:./lib:./plugin
    CFLAGS += -O3 -Wall -rdynamic -ldl
    CXXFLAGS += -O3 -Wall -rdynamic -ldl

    LDFLAGS += ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
    LDFLAGS += -L${DLLOUTPATH} \
               -lexample_dll_${OUTSUFFIX}
endif
