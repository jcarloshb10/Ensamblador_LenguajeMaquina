.model small
.stack 64
.data
.code
inicial proc far
    
    mov cx,7
	mov ax, 64
	mov dl,2

    CICLO:
    div dl
	loop CICLO

end




