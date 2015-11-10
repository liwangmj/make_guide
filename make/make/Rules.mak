CVER ?= release
CCPU ?= 64
CPLATFORM ?= linux
CCOMPILER ?= g++

ifeq ($(CVER), debug)
else
    CVER := release
endif

ifeq ($(CCPU), 8)
else ifeq ($(CCPU), 16)
else ifeq ($(CCPU), 32)
else
    CCPU := 64
endif

APPOUTPATH := ${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILER}_${CCPU}/${CVER}
DLLOUTPATH := ${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILER}_${CCPU}/${CVER}
LIBOUTPATH := ${PROJECTPATH}/lib/${CPLATFORM}_${CCOMPILER}_${CCPU}/${CVER}
$(shell mkdir -p ${APPOUTPATH})
$(shell mkdir -p ${DLLOUTPATH})
$(shell mkdir -p ${LIBOUTPATH})

INCLUDES := -I${PROJECTPATH}/include/example_app \
            -I${PROJECTPATH}/include/example_dll \
            -I${PROJECTPATH}/include/example_lib

FINDSUB := $$(find ./${SUBDIRS} -name '*.o')

export MAKEINCLUDE_PLATFORM=${PROJECTPATH}/make/${CPLATFORM}_${CCOMPILER}.mak
include ${MAKEINCLUDE_PLATFORM}

all: subdirs

.PHONY: clean
clean: cleansubdirs

.PHONY: help
help:
	@echo "Help:"
	@echo "  make           ""默认执行make CVER=release all"
	@echo "  make clean     ""清理编译目录"
	@echo "  make help      ""显示帮助列表"
	@echo "Params:"
	@echo "  CVER           ""=debug或则=release"
	@echo "  CCPU           ""=32或=64或其他"
	@echo "  CPLATFORM      ""=linux或其他平台"
	@echo "  CCOMPILER      ""=g++或其他平台"
	@echo "Example:"
	@echo "  make CVER=debug CCPU=64 CPLATFORM=linux CCOMPILER=g++ all"

.PHONY: subdirs ${SUBDIRS} cleansubdirs
subdirs: ${SUBDIRS}
${SUBDIRS}:
	${MAKE} -C $@ all

cleansubdirs:
	@for dir in ${SUBDIRS}; do \
		${MAKE} -C $$dir clean; \
	done

%.o: %.cpp
	${CXX} ${CXXFLAGS} ${INCLUDES} -c $< -o $@
%.o: %.cc
	${CXX} ${CXXFLAGS} ${INCLUDES} -c $< -o $@
%.o: %.c
	${CC} ${CFLAGS} ${INCLUDES} -c $< -o $@
