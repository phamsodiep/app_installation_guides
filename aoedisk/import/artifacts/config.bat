rem This is the root directory of the ddk.
set ddkdir=c:\WinDDK\7600.16385.1

rem Next two lines are duplicated in Makefile, edit both when adding files or changing pxe style.
set c=driver.c registry.c bus.c disk.c aoe.c aoe_send.c crc.c protocol.c debug.c 
set pxestyle=asm
