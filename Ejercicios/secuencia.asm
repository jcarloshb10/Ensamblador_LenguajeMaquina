.model small
.stack 64
.data
.code
inicial proc far
    mov cx,5
	mov al,5
	mov bl,4
    CICLO:
    add al,bl
	dec bl
	loop CICLO

end




