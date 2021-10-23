module vhellokernel

#define VV_LOCAL_SYMBOL
#define EMPTY_STRUCT_DECLARATION

#include "linuxmodule.c"

fn mymodule_init() int {
	return 0
}

fn mymodule_exit() {
}
