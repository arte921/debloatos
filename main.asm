; tty mode
mov ah, 0x0e

; zet steeds een letter in al...
mov al, 'f'
int 0x10

; print:
;     int 0x10
;     mov al, 10
;     int 0x10
;     mov al, 13
;     int 0x10


f db 1
v db 0
t db 0

i db 0
temp db 0


loop:
    cmp	byte [i], 5
    jge	stop

    mov al, [f]
    int 0x10

    mov al, [f]
    add al, 48
    int 0x10

    mov	al, [v]
    add	al, [t]
    mov [f], al

    mov	al, [v]
    mov	[t], al
    mov	al, [f]
    mov [v], al

    mov	al, [i]
    add	al, 1
    mov [i], al
    jmp	loop


; infinite loop
stop:
    mov al, 's'
    int 0x10
    jmp $


; om de 0xaa55 (om bootable te maken) aan het einde (na 510 bytes) te houden
times 510-($-$$) db 0
dw 0xaa55