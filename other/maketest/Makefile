
export TOP_DIR := $(realpath .)

include $(TOP_DIR)/makefiles/common.mk

FIND = /usr/bin/find
CTAGS = /usr/bin/ctags --c++-kinds=+p --c-kinds=+px-n --fields=+iatfS --extra=+q -I __wur,__THROW,__nonnull+
CSCOPE = /usr/bin/cscope -bkq

make_list := lib_bar
make_list += lib_foo
#make_list += lib_hwfunc
#make_list += lib_mcu
#make_list += lib_chzcfg
#make_list += lib_vsp
#make_list += lib_chzaudio

ifeq (arm, $(ARCH))
else ifeq (i386, $(ARCH))
endif

make_list += app_test
#make_list += tools
#make_list += gui_chz

all:
	@$(call make_in_list, $(make_list), all)

tar:
	git archive --format=tar.gz --prefix=soft/ HEAD > soft.tar.gz

tag:
	$(make_debug)$(RM) tags
	$(make_debug)$(RM) cscope.*
	$(make_debug)list="$(make_list)"; for p in $$list; do \
		$(FIND) $$p -name '*.[ch]' -exec realpath {} + >> cscope.list; \
		$(FIND) $$p -name '*.cpp' -exec realpath {} + >> cscope.list; \
		done 
	$(make_debug) $(FIND) $(third_party_inc_dir) -name '*.[ch]' -exec realpath {} + >> cscope.list
	$(make_debug)$(CTAGS) -L cscope.list -f tags;
	$(make_debug)$(CSCOPE) -icscope.list -fcscope.out;
	$(make_debug)$(RM) cscope.list

win_lib:
	gcc -shared -std=c++0x -fPIC -o lib_chzcfg.dll lib_chzcfg/*.cpp lib_pub/*.cpp

.PHONY: clean distclean
clean unit_test run_unit_test:
	@$(call make_in_list, $(make_list), $@)

distclean:
	@$(call make_in_list, $(make_list), $@)
	@-test -f tags && rm cscope.* tags;true 
