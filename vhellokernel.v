module vhellokernel

#define VV_LOCAL_SYMBOL
#define EMPTY_STRUCT_DECLARATION

#include "linuxmodule.c"

fn C.pr_info(msg &char)

fn mymodule_init() int {
	C.pr_info(c"Hello world from a V kernel module")
	return 0
}

fn mymodule_exit() {
	C.pr_info(c"Goodbye world from a V kernel module")
}
