; tty mode
mov ah, 0x0e

; zet steeds een letter in al...
mov al, 'b'
int 0x10


f db 1
v db 0
t db 0

temp db 0


loop:
    ; stop als greater/equal 4
    cmp	cl, 4
    jge	stop

    ; print de waarde van cl
    mov al, cl
    add al, 65
    int 0x10

    ; f = v + t
    mov	al, byte [v]
    add	al, byte [t]
    mov byte [f], al

    ; t  = v
    mov	al, byte [v]
    mov	byte [t], al

    ; v = f
    mov al, byte [f]
    mov byte [v], al

    inc cl

    jmp	loop


stop:
    mov al, 's'
    int 0x10
    jmp $


; om de 0xaa55 (om bootable te maken) aan het einde (na 510 bytes) te houden
times 510-($-$$) db 0
dw 0xaa55