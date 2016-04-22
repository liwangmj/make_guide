CVER ?= release
CCPU ?= 64
CCOMPILER ?= g++
CPLATFORM ?= linux
PREFIX ?= ${PROJECTPATH}/packaging

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

export MAKEINCLUDE_PLATFORM=${PROJECTPATH}/toolchain/${CPLATFORM}_${CCOMPILER}.mak
include ${MAKEINCLUDE_PLATFORM}

all: subdirs

.PHONY: install
install:
	@(mkdir -p ${PREFIX}/bin)
	@(mkdir -p ${PREFIX}/lib)
	@(mkdir -p ${PREFIX}/include)
	cp -rf ${APPOUTPATH}/* ${PREFIX}/bin
	cp -rf ${DLLOUTPATH}/* ${PREFIX}/lib
	cp -rf ${LIBOUTPATH}/* ${PREFIX}/lib
	cp -rf ${PROJECTPATH}/include/* ${PREFIX}/include
	chmod 755 -R ${PREFIX}/bin
	chmod 755 -R ${PREFIX}/lib
	chmod 755 -R ${PREFIX}/include

.PHONY: test
test:
	@(${APPOUTPATH}/${RUNTESTNAME})

.PHONY: clean
clean: cleansubdirs

.PHONY: help
help:
	@echo "--------------------------------------------------------------"
	@echo "Help:"
	@echo "  make           ""默认执行make CVER=release all"
	@echo "  make test      ""执行test程序进行测试"
	@echo "  make install   ""安装到指定目录，默认为/usr/local"
	@echo "  make clean     ""清理编译目录"
	@echo "  make help      ""显示帮助列表"
	@echo "Params:"
	@echo "  CVER           ""=debug或则=release"
	@echo "  CCPU           ""=32或=64或其他"
	@echo "  CPLATFORM      ""=linux或其他平台"
	@echo "  CCOMPILER      ""=g++或其他平台"
	@echo "  PREFIX       ""=/usr/local或者自定义目录"
	@echo "Example:"
	@echo "  make CVER=debug CCPU=64 CPLATFORM=linux CCOMPILER=g++ all"
	@echo "  make PREFIX=/usr/local install"
	@echo "  make CVER=debug clean"
	@echo "  make CVER=debug test"
	@echo "--------------------------------------------------------------"

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
