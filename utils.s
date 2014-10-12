printstring:
        pusha
        mov ah, 0x0e
stringloop:
	mov al, [bx]
        cmp al, 0
        je stringret        
        int 0x10
        inc bx
        jmp stringloop
stringret:      
        popa
        ret
