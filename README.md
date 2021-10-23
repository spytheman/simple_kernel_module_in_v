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

## Further reading:
https://tldp.org/LDP/lkmpg/2.6/lkmpg.pdf
https://github.com/vlang/v/blob/master/doc/docs.md
