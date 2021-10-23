# A simple Linux kernel module, written in V

The purpose of this repo, is to show how to write and test
a very simple Linux kernel module,
using [the V programming language](https://vlang.io/) .

NB: this is *very* experimental and may break in the future.
It works as of 2021/11/23 with gcc 10.3.0 and V aa22751 .

## Prerequisites:
A C compiler, and a V compiler.

On a Debian system, you can install them with:
```bash
apt-get install gcc
git clone https://github.com/vlang/v && cd v && make && ./v symlink
```

Once you have them installed, you can keep them up to date with:
```bash
apt-get upgrade
v up
```

## Building the kernel module:
`make`

## Loading the module in your kernel:
`insmode vhellokernel.ko`

## Verifying that the module was loaded in the kernel:
`cat /proc/modules |grep vhellokernel`

## Removing the module from your kernel:
`rmmod vhellokernel.ko`

## `make clean test`
```
0[12:47:53] /v/misc/2021_10_22__02/simple_kernel_module_in_v LINUX $ make clean test
make -C /lib/modules/`uname -r`/build M=$PWD clean
make[1]: Entering directory '/usr/src/linux-headers-5.11.0-38-generic'
  CLEAN   /v/misc/2021_10_22__02/simple_kernel_module_in_v/Module.symvers
make[1]: Leaving directory '/usr/src/linux-headers-5.11.0-38-generic'
rm -rf vhellokernel.o vhellokernel.c
v -no-builtin -no-preludes -o vhellokernel.c vhellokernel.v
make -C /lib/modules/`uname -r`/build M=$PWD modules
make[1]: Entering directory '/usr/src/linux-headers-5.11.0-38-generic'
  CC [M]  /v/misc/2021_10_22__02/simple_kernel_module_in_v/vhellokernel.o
  MODPOST /v/misc/2021_10_22__02/simple_kernel_module_in_v/Module.symvers
  CC [M]  /v/misc/2021_10_22__02/simple_kernel_module_in_v/vhellokernel.mod.o
  LD [M]  /v/misc/2021_10_22__02/simple_kernel_module_in_v/vhellokernel.ko
make[1]: Leaving directory '/usr/src/linux-headers-5.11.0-38-generic'
make load
make[1]: Entering directory '/v/misc/2021_10_22__02/simple_kernel_module_in_v'
sudo insmod vhellokernel.ko
make[1]: Leaving directory '/v/misc/2021_10_22__02/simple_kernel_module_in_v'
cat /proc/modules |grep vhellokernel
vhellokernel 16384 0 - Live 0x0000000000000000 (OE)
make unload
make[1]: Entering directory '/v/misc/2021_10_22__02/simple_kernel_module_in_v'
sudo rmmod vhellokernel.ko
make[1]: Leaving directory '/v/misc/2021_10_22__02/simple_kernel_module_in_v'
0[12:47:56] /v/misc/2021_10_22__02/simple_kernel_module_in_v LINUX $
```

## Further reading:
1. https://tldp.org/LDP/lkmpg/2.6/lkmpg.pdf

2. https://github.com/vlang/v/blob/master/doc/docs.md
