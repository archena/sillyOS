#! /bin/sh

nasm bootloader.s -f bin -o bootloader.bin &&
objdump --disassembler-options=intel -D -b binary -mi386 -Maddr16,data16 bootloader.bin &&
qemu-system-i386 bootloader.bin 
