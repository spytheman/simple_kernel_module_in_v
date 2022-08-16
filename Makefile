## See also https://www.kernel.org/doc/html/latest/kbuild/modules.html

KDIR ?= /lib/modules/`uname -r`/build

all: vhellokernel.c vhellokernel.c.v
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
	rm -rf vhellokernel.o vhellokernel.c	

PHONY += vhellokernel.c vhellokernel.o test load unload

vhellokernel.o: vhellokernel.c vhellokernel.c.v
vhellokernel.c: vhellokernel.c.v
	v -no-builtin -no-preludes -o vhellokernel.c vhellokernel.c.v

test: all
	make load
	cat /proc/modules |grep vhellokernel
	make unload

load:
	sudo insmod vhellokernel.ko

unload:
	sudo rmmod vhellokernel.ko
	
