APPOUTPATH := ${PROJECTPATH}/bin/${CPLATFORM}_${CCPU}/${CVER}
DLLOUTPATH := ${PROJECTPATH}/bin/${CPLATFORM}_${CCPU}/${CVER}
LIBOUTPATH := ${PROJECTPATH}/lib/${CPLATFORM}_${CCPU}/${CVER}
$(shell mkdir -p ${APPOUTPATH})
$(shell mkdir -p ${DLLOUTPATH})
$(shell mkdir -p ${LIBOUTPATH})

CCACHE  := ccache
OBJCOPY := objcopy
BEAR    := bear
CC  := g++
CXX := g++
AR  := ar
LD  := ld
RM  := rm -f

ARFLAGS  := rcs
CFLAGS   := -O2 -Wall -fPIC -D__LINUX
CXXFLAGS := -O2 -Wall -fPIC -D__LINUX
LDFLAGS  := -lm -Wl,-rpath=.

FINDSUB  := $$(find ./${SUBDIRS} -name '*.o')

INCLUDES := -I${PROJECTPATH}/include/example_app \
            -I${PROJECTPATH}/include/example_dll \
            -I${PROJECTPATH}/include/example_lib

ifeq ($(CVER), debug)
OUTSUFFIX := ${CPLATFORM}_${CCPU}_d
CFLAGS    += -g -D__DEBUG
CXXFLAGS  += -g -D__DEBUG
LDFLAGS   += ${LIBOUTPATH}/libexample_lib_linux_64_d.a
LDFLAGS   += -L${DLLOUTPATH} \
             -lexample_dll_linux_64_d

else
OUTSUFFIX := ${CPLATFORM}_${CCPU}
LDFLAGS   += ${LIBOUTPATH}/libexample_lib_linux_64.a
LDFLAGS   += -L${DLLOUTPATH} \
             -lexample_dll_linux_64

endif
