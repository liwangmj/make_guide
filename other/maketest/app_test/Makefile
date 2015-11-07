#TOPDIR = ../
include $(TOP_DIR)/makefiles/common.mk

ifeq (arm, $(ARCH))
else ifeq (i386, $(ARCH))
endif

lib_name = app_chz
libs += bar foo
main_bin := chz_app.$(ARCH).elf
defines += -DDEBUG

#all:$(main_bin) example install
all:$(main_bin)
	
#$(main_bin): main.cpp $(cur_ar_lib) 
$(main_bin): main.cpp $(cur_ar_lib)
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(CPP) $(cppflags) -o $@ $^ $(libflags) 

.PHONY: $(main_bin)

include $(TOP_DIR)/makefiles/rules.mk

