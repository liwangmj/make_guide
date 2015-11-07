TOP_DIR = $(realpath ../)
include $(TOP_DIR)/makefiles/common.mk

ifeq (arm, $(ARCH))
else ifeq (i386, $(ARCH))
endif

libs = 
lib_name = foo
defines += -DDEBUG

all:debug_ar_lib

include $(TOP_DIR)/makefiles/rules.mk
