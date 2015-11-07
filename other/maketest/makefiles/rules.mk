.init. : $(init_dirs);

$(init_dirs):
	$(make_debug)$(call echo_make_info, 'mkdir', $@)
	$(make_debug)mkdir -p $@

$(build_dir)/%.$(obj_suffix) : %.cpp
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(CPP) $(cppflags) $(defines) -c -o $@ $<

$(build_dir)/%.$(obj_suffix) : %.c
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(CC) $(cflags) $(defines) -c -o $@ $<

$(example_dir)/%.$(example_suffix) : $(example_dir)/%.c $(cur_ar_lib)
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(CPP) $(cppflags) $(defines) -o $@ $< $(libflags)

$(example_dir)/%.$(example_suffix) : $(example_dir)/%.cpp $(cur_ar_lib)
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(CPP) $(cppflags) $(defines) -o $@ $< $(libflags)

unit_test : $(unit_test_bin);

example : $(example_bins);
	$(make_debug)test -e $(example_dir)/install && (cd $(example_dir);./install);true

install : 
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)test -e install && ./install;true
	
$(cur_ar_lib) : $(ar_objs)
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(AR) $(arflags) $@ $^

debug_ar_lib : $(cur_ar_lib) ;
#debug_ar_lib : $(cur_ar_lib) 

run_unit_test : $(unit_test_bin)
	./$(unit_test_bin) --user_def_output

check_unit_test:$(unit_test_bin)
	$(make_debug)$(MEMCHECK) --log-file=valgrind.log -v ./$(unit_test_bin) --user_def_output $(mem_check_params)
	$(make_debug)grep 'ERROR SUMMARY' valgrind.log

$(unit_test_bin) : $(unit_test_sources) $(cur_ar_lib) 
	$(make_debug)$(call echo_make_info, 'make', $@)
	$(make_debug)$(CPP) $(cppflags) -o $@ $< $(libflags) -lgtest -lgtest_custom_main 

indent :
	$(make_debug)find . -maxdepth 1 -name '[!\.]*.[ch]' -o -name '*.cpp' | xargs indent
	$(make_debug)find . -maxdepth 1 -name '[!\.]*.[ch]' -o -name '*.cpp' | xargs astyle -A1 -f -p -c -j -y -z2 -U
	$(make_debug)find . -maxdepth 1 -name '*.orig' -o -name '*~' | xargs rm -f

check:cpp_check mem_check

cpp_check:
	$(make_debug)cppcheck . --enable=all -q

mem_check:$(ALL_BIN)
	$(make_debug)$(MEMCHECK) --log-file=valgrind.log -v ./$(main_bin) $(mem_check_params)
	$(make_debug)grep 'ERROR SUMMARY' valgrind.log

example_check:example
	$(make_debug)$(call run_in_list, $(MEMCHECK) --log-file=valgrind.log -v ,$(example_bins), $(mem_check_params))

auto_deps = 0
ifeq (,$(MAKECMDGOALS))
auto_deps = 1
else ifeq (all, $(findstring all, $(MAKECMDGOALS)))
auto_deps = 1
endif

ifeq (1, $(auto_deps))
-include $(cur_deps)
endif

$(build_dir)/%.$(dep_suffix) : %.cpp
	$(make_debug)$(call echo_make_info, make, $@)
	$(make_debug)set -e; rm -f $@; \
		$(CPP) -MM $(cppflags) $(defines) $(libflags) $< > $@.$$$$; \
		sed 's,\($*\)\.o[ :]*,$(build_dir)/\1.$(obj_suffix) $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

$(build_dir)/%.$(dep_suffix) : %.c
	$(make_debug)$(call echo_make_info, make, $@)
	$(make_debug)set -e; rm -f $@; \
		$(CC) -MM $(cflags) $(defines) $(libflags) $< > $@.$$$$; \
		sed 's,\($*\)\.o[ :]*,$(build_dir)/\1.$(obj_suffix) $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

tags : $(tags_dir) $(tags_list) $(tags_dir)/$(lib_name).tags $(tags_dir)/$(lib_name).out .exrc;

$(tags_list) :
	$(make_debug)find $(CURDIR) -name "*.cpp" -o -name "*.c" -o -name "*.h" > $(tags_list)

$(tags_dir)/$(lib_name).tags : $(cur_sources)
	$(make_debug)$(call echo_make_info, make, $@)
	$(make_debug)$(CTAGS) -f $(tags_dir)/$(lib_name).tags -L$(tags_list)

$(tags_dir)/$(lib_name).out : $(cur_sources)
	$(make_debug)$(call echo_make_info, make, $@)
	$(make_debug)$(CSCOPE) -f$(tags_dir)/$(lib_name).out -i$(tags_list)

.exrc : 
	$(make_debug)$(call echo_make_info, make, $@)
	$(make_debug)echo "" > $@
	$(make_debug)echo "if filereadable(\"$(tags_dir)/$(lib_name).tags\")" >> $@
	$(make_debug)echo "set tags+="$(tags_dir)/$(lib_name).tags >> $@
	$(make_debug)echo "endif" >> $@
	$(make_debug)echo "if filereadable(\"$(tags_dir)/$(lib_name).out\")" >> $@
	$(make_debug)echo "execute "\'cscope add $(tags_dir)/$(lib_name).out\' >> $@
	$(make_debug)echo "endif" >> $@

tar:
	git archive --format=tar.gz --prefix=$(dir_name)/ HEAD > $(TOP_DIR)/$(dir_name).tar.gz

help:
	@echo "Help:"
	@echo "  make               ""默认执行make Debug"
	@echo "  make indent        ""将当前目录下的c和cpp文件都转换成astyle格式"
	@echo "  make mem_check     ""执行vargrind检查"
	@echo "  make static_check  ""执行cppcheck, clang, flawfind等工具的静态代码检查"
	@echo "  make unit_test          """
	@echo "  make run_unit_test      """
	@echo "  make help          """

.PHONY: clean distclean check install

clean:
	$(make_debug)$(RM) $(cur_objs) 
	$(make_debug)$(RM) $(ALL_BIN) 
	$(make_debug)$(RM) *.log *.elf *.a *.so .exrc
	$(make_debug)$(RM) $(example_dir)/*.$(example_suffix)

distclean:clean
	$(make_debug)$(RM) $(build_dir)

ifneq (help, $(findstring help, $(MAKECMDGOALS)))
ifneq (clean, $(findstring clean, $(MAKECMDGOALS)))
-include .init.
endif
endif

