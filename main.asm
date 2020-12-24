; tty mode
mov ah, 0x0e

; zet steeds een teken in de accumulator, en interrupt 0x10 om de printen  
mov al, 'F'
int 0x10


f db 0
v db 1
t db 0

i db 0

mov byte [f], 2
mov byte [v], 1
mov byte [t], 0
mov byte [i], 0


loop:
    ; mov al, 'a'
    ; int 0x10
    ; stop als byte [i] greater/equal 4
    cmp	byte [i], 5
    jge	stop

    ; print de inhoud van f
    mov al, [f]
    add al, 48
    int 0x10

    mov al, ' '
    int 0x10

    ; mov al, 'c'
    ; int 0x10

    ; f = v + t
    mov	al, [v]
    add	al, [t]
    mov [f], al

    ; t  = v
    mov	al, [v]
    mov	[t], al

    ; v = f
    mov al, [f]
    mov [v], al

    ; inc byte [f]
    inc byte [i]

    jmp	loop


stop:
    mov al, 's'
    int 0x10
    jmp $


; om de 0xaa55 (om bootable te maken) aan het einde (na 510 bytes) te houden
times 510-($-$$) db 0
dw 0xaa55