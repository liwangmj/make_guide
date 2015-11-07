CVER      ?= debug
CCPU      ?= 64
CPLATFORM ?= i386

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

ifeq ($(CPLATFORM), i386)
export MAKEINCLUDE_i386=${PROJECTPATH}/make/i386.mak
include ${MAKEINCLUDE_i386}
endif

all: subdirs

.PHONY: clean
clean: cleansubdirs

.PHONY: help
help:
	@echo "Help:"
	@echo "  make           ""默认执行make all"
	@echo "  make clean     ""清理编译目录"
	@echo "  make help      ""显示帮助列表"
	@echo "Params:"
	@echo "  CVER           ""=debug或则=release"
	@echo "  CCPU           ""=32或=64或其他"
	@echo "  CPLATFORM      ""=i386或其他make平台配置文件"
	@echo "Example:"
	@echo "  make CVER=debug CCPU=64 CPLATFORM=i386 all"

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
