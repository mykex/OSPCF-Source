; -- PCF Operating System --
; See [docs\COPYRIGHT.txt] for more info
;
; file: system\kernel\arch\x86\tssasm.asm
; desc: Task Segment Selector aux functions

[GLOBAL _x86TssFlush]
_x86TssFlush:
    mov ax, 0x2B      	; Load the index of our TSS structure - The index is
                      	; 0x28, as it is the 5th selector and each is 8 bytes
                      	; long, but we set the bottom two bits (making 0x2B)
                      	; so that it has an RPL of 3, not zero.
    ltr ax            	; Load 0x2B into the task state register.
    ret			; return
