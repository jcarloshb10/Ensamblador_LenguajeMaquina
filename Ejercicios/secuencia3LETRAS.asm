.model small
.stack 64
.data
.code
inicial proc far
    
    mov ah, 2
	mov dl, 41;	A 
	SALTO:
    int 21
	inc dl
	
	cmp dl, 5a;	Z
	jbe SALTO
	int 20

end




