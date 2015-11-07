make_debug ?= @
# make_debug ?= 

ARCH ?= i386

export ARCH

jobnums := 1
dir_name := $(shell basename `pwd`)

# 目录位置定义
makefiles_dir := $(realpath $(TOP_DIR)/makefiles)
third_party_dir := $(TOP_DIR)/third_party
lib_dir := $(TOP_DIR)/lib
unit_test_dir = unit_test
example_dir = example

# 常用命令和变量
CLANG := clang
CP := /bin/cp
MV := /bin/mv
RM := -/bin/rm -rf
RMDIR := -/bin/rmdir 
MAKE := make -r -R -s
# MAKE := make -r -R -s --no-print-directory 
CTAGS = /usr/bin/ctags --c++-kinds=+p --c-kinds=+px-n --fields=+iatfS --extra=+q -I __wur,__THROW,__nonnull+
CSCOPE = /usr/bin/cscope -bkq
VALGRIND ?= valgrind -q
MEMCHECK ?= $(VALGRIND) --tool=memcheck --leak-check=full --leak-resolution=high --show-reachable=yes 
VALGRIND_LOG ?= valgrind.log

#平台相关的编译处理
include $(makefiles_dir)/$(ARCH).mk
ifneq (, $(CROSS))
AR := $(CROSS)ar
LD := $(CROSS)ld
CC := $(CROSS)gcc
CPP := $(CROSS)g++
OBJCOPY := $(CROSS)objcopy
endif

# 前后缀定义
so_suffix ?= $(ARCH).so
ar_suffix ?= $(ARCH).a
head_suffix ?= h
obj_suffix ?= $(ARCH).o
dep_suffix ?= $(ARCH).d
unit_test_suffix ?= $(ARCH).ut
example_suffix ?= $(ARCH).elf

build_dir := build
tags_dir := build
tags_list := $(tags_dir)/cscope.list
lib_name := 
cur_c_sources := $(wildcard *.c)
cur_cpp_sources := $(wildcard *.cpp) 
cur_h_sources := $(wildcard *.h) 
cur_sources := $(cur_c_sources) $(cur_cpp_sources) $(cur_h_sources)
cur_objs := $(addprefix $(build_dir)/, $(cur_c_sources:%.c=%.$(obj_suffix)))
cur_objs += $(addprefix $(build_dir)/, $(cur_cpp_sources:%.cpp=%.$(obj_suffix)))
cur_deps := $(addprefix $(build_dir)/, $(cur_c_sources:%.c=%.$(dep_suffix)))
cur_deps += $(addprefix $(build_dir)/, $(cur_cpp_sources:%.cpp=%.$(dep_suffix)))
ar_objs := $(filter-out $(build_dir)/main.$(obj_suffix),$(cur_objs))

unit_test_c_sources := $(wildcard $(unit_test_dir)/*.c)
unit_test_cpp_sources := $(wildcard $(unit_test_dir)/*.cpp) 
unit_test_sources := $(unit_test_c_sources) $(unit_test_cpp_sources)
unit_test_bin := unit_test.$(ARCH).elf
unit_test_objs := $(addprefix $(build_dir)/, $(unit_test_c_sources:%.c=%.$(obj_suffix)))
unit_test_objs += $(addprefix $(build_dir)/, $(unit_test_cpp_sources:%.cpp=%.$(obj_suffix)))
unit_test_deps := $(addprefix $(build_dir)/, $(unit_test_c_sources:%.c=%.$(dep_suffix)))
unit_test_deps += $(addprefix $(build_dir)/, $(unit_test_cpp_sources:%.cpp=%.$(dep_suffix)))

example_c_sources := $(wildcard $(example_dir)/*.c)
example_cpp_sources := $(wildcard $(example_dir)/*.cpp) 
example_sources := $(example_c_sources) $(example_cpp_sources)
example_bins := $(example_c_sources:%.c=%.$(example_suffix))
example_bins += $(example_cpp_sources:%.cpp=%.$(example_suffix))
example_deps := $(example_c_sources:%.c=%.$(dep_suffix))
example_deps += $(example_cpp_sources:%.cpp=%.$(dep_suffix))

top_inc_dir := $(TOP_DIR)/includes
third_party_inc_dir := $(TOP_DIR)/third_party/include
third_party_lib_dir := $(TOP_DIR)/third_party//lib/$(ARCH)

pkg_cflags += $(shell test -z $(lib_name) || (export PKG_CONFIG_PATH=.;pkg-config \
			  --define-variable=prefix=$(TOP_DIR)/$(dir_name) \
			  --define-variable=ARCH=$(ARCH) --cflags $(lib_name)))
pkg_libs += $(shell test -z $(lib_name) || (export PKG_CONFIG_PATH=.;pkg-config \
			  --define-variable=prefix=$(TOP_DIR)/$(dir_name) \
			  --define-variable=ARCH=$(ARCH) --libs $(lib_name)))
pkg_cflags += $(shell list='$(libs)'; for p in $$list; do \
			  export PKG_CONFIG_PATH=$(TOP_DIR)/lib_$$p;\
			  pkg-config \
			  --define-variable=prefix=$(TOP_DIR)/lib_$$p \
			  --define-variable=ARCH=$(ARCH) --cflags $$p;done)
pkg_libs += $(shell list='$(libs)'; for p in $$list; do \
			  export PKG_CONFIG_PATH=$(TOP_DIR)/lib_$$p;pkg-config \
			  --define-variable=prefix=$(TOP_DIR)/lib_$$p \
			  --define-variable=ARCH=$(ARCH) --libs $$p;done)

libflags += -L$(third_party_lib_dir) 
libflags += $(pkg_libs)

defines += -DARCH_$(ARCH)
#cppflags += -Wall -Werror -std=c++0x -g -O0 -I$(TOP_DIR) -I. -include lib_pub/debug.h $(pkg_cflags)
cppflags += -Wall -Werror -std=c++0x -g -O0 -I$(TOP_DIR) -I. $(pkg_cflags)
cppflags += -I$(third_party_inc_dir) -I$(top_inc_dir)
#  cflags += -Wall -Werror -g -O0 
#cflags += -Wall -g -O0 -I$(TOP_DIR) -include lib_pub/debug.h $(pkg_cflags)
cflags += -Wall -g -O0 -I$(TOP_DIR) $(pkg_cflags)
cflags += -I$(third_party_inc_dir) -I$(top_inc_dir)
arflags = cru

#init_dirs = $(build_dir) $(build_dir)/$(unit_test_dir)
init_dirs = $(build_dir)

make_in_list = list="$(1)"; for p in $$list; do $(MAKE) -C $$p $(2) -j $(jobnums); done
run_in_list = list='$(2)'; for p in $$list; do printf " %s -> %-40s\n" $(1) $$p; $$p $(3) ; done
echo_debug = printf ">>>>> [%s] = %s <<<<<\n" $(1) $(2)
echo_make_info = printf " [%s] %-8s -> %-16s %s %s...\n" $(ARCH) $(1) $(lib_name) $(2)

cur_ar_lib = lib$(lib_name).$(ar_suffix)
