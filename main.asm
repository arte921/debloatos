; tty mode
mov ah, 0x0e

; zet steeds een letter in al...
mov al, 'h'
; ...en stuur dan 0x10 interrupt, die inhoud van register al naar tty print
int 0x10

mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10

; infinite loop
jmp $


; om de 0xaa55 (om bootable te maken) aan het einde (na 510 bytes) te houden
times 510-($-$$) db 0
dw 0xaa55