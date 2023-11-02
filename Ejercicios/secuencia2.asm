.model small
.stack 64
.data
.code
inicial proc far
    
    mov cx, 6
	mov dl, 41
	mov ah, 2
	int 21
    CICLO:
    inc dl
	loop CICLO
	int 20

end




