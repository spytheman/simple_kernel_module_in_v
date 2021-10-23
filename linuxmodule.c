#include <linux/module.h>

int vhellokernel__mymodule_init(void);
void vhellokernel__mymodule_exit(void);

module_init(vhellokernel__mymodule_init);
module_exit(vhellokernel__mymodule_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Delyan Angelov");
MODULE_DESCRIPTION("A simple kernel module written in V");
MODULE_INFO(board, "My board");
