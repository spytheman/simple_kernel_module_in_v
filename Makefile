KDIR ?= /lib/modules/`uname -r`/build

all: vhellokernel.c vhellokernel.v
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
	rm -rf vhellokernel.o vhellokernel.c	

PHONY += vhellokernel.c vhellokernel.o

vhellokernel.o: vhellokernel.c vhellokernel.v
vhellokernel.c: vhellokernel.v
	v -showcc -d no_backtrace -nofloat -no-builtin -no-preludes -freestanding -o vhellokernel.c vhellokernel.v
