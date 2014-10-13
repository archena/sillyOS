;;; A bootloader for a silly little operating system
        [org 0x7c00]

        ;; Set up the stack       
        mov bp, 0x8000
        mov sp, bp

        ;; Startup message
        mov bx, message
        call printstring

        ;; Loop forever to stop the CPU executing things that it shouldn't!
        jmp $
	%include "utils.s"
message:
        db "sillyOS bootloader!",0

        ;; A bootsector must be 512 bytes, so fill remaining bytes with 0s and end with the magic number
        times 510-($-$$) db 0
        dw 0xaa55
