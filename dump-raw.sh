#! /bin/sh

if [ -z $1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Dumps assembler instructions for raw machine code files
objdump --disassembler-options=intel -D -b binary -mi386 -Maddr16,data16 $1
