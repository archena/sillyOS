        [org 0x7c00]
        mov bx, message
        call printstring
        
        jmp $
	%include "utils.s"
message:
        db "sillyOS bootloader!",0

        times 510-($-$$) db 0
        dw 0xaa55
