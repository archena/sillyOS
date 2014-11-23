;;; A bootloader for a silly little operating system
[bits 16]
[org 0x7c00]

;; Set up the stack       
mov bp, 0x9000
mov sp, bp

;; Switch to 32-bit protected mode
cli
lgdt [gdt_descriptor]
mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CODE_SEG:start_protected

[bits 32]
start_protected: 
;;; Once we've entered 32-bit protected mode, registers need to be re-initialised
        mov ax, DATA_SEG
        mov ds, ax
        mov ss, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ebx, 0x90000
        mov esp, ebp

        mov ebx, BOOT_MESSAGE
        call printstr

	jmp $

        %include "printer.s"
        %include "gdt.s"

BOOT_MESSAGE db "SillyOS!", 0
        
;; A bootsector must be 512 bytes, so fill remaining bytes with 0s and end with the magic number
times 510-($-$$) db 0
dw 0xaa55
