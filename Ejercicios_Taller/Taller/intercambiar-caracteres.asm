.model small
.stack 64
.data
;  
str1 db 'ABCDEFGHI$'
str2 db 'JKLMNOPQR$'
;
.code
.startup
;      
    mov ah,9h
    lea dx, str1
    int 21h     
    lea dx, str2
    int 21h 
    ; -------------             
    mov cx, 9h
    lea si, str1
    lea di, str2
    
    ciclo:    
        mov al, [si]
        mov bl, [di]
        xchg al, bl
        mov [si], al
        mov [di], bl
        inc si
        inc di
    loop ciclo       
    
    lea dx, str1
    int 21h     
    lea dx, str2
    int 21h 
;
.exit