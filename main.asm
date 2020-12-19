; tty mode
mov ah, 0x0e

; zet steeds een letter in al...
mov al, 4
; ...en stuur dan 0x10 interrupt, die inhoud van register al naar tty print
int 0x10

f dw 1
v dw 0
t dw 0

i dw 0

main:
	mov	dword [f], 1
	mov	dword [v], 0
	mov	dword [t], 0
	mov	dword [i], 0

    jmp loop

loop:
	cmp	dword [i], 10
    jge	stop

	mov	eax, [v]
	add	eax, [t]

    mov al, [f]
    int 0x10

	mov	[f], eax
	mov	eax, [v]
	mov	[t], eax
	mov	eax, [f]
	mov	[v], eax

	; mov	eax, [i]
	add	dword [i], 1
	; mov	, eax
	jmp	loop


; infinite loop
stop:
    jmp stop


; om de 0xaa55 (om bootable te maken) aan het einde (na 510 bytes) te houden
times 510-($-$$) dw 0
dw 0xaa55