
.model small
.stack 64
.data        

.code
inicio proc far 
    mov cx, 7
	mov al, 3
	mov dl, 1

    CICLO:    
	mul dl
	mov bl,al

	inc dl
	mov al, 3
	loop CICLO                     
    
end 