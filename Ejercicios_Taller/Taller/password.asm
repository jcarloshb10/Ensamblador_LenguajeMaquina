.stack 64
.data           

datos label byte

str1 db 'Password: ', '$'
str2 db 'Coinciden', '$'
str3 db 'No coinciden', '$'
password db 'emu8086', '$'
input db 00h

.code
.startup
    call limpiar
    mov ax, 0205h
    lea bx, str1
    call mostrar
    mov bp, 00h

    lea si, input
    mov cl, 00
    jmp bucle

    bucle:
        call digitar
        cmp [si], 0dh
        je fin
        inc cl
        inc si
        jmp bucle
    
    inicio_comp:
        mov ch, 00h
        sub si, cx
        lea di, password
        jmp comp

    comp:
        cmp [si], [di]
        mov bp, 0
        jne incorrecta
        inc si
        inc di
        loop comp
        mov bp, 1
        jmp correcta

    correcta:
        lea bx, str2
        jmp fin
    
    incorrecta:
        lea bx, str3
        jmp fin
    
    fin:
        call limpiar
        mov ax, 0205h
        call mostrar             
.exit  
       
mostrar proc near 
    mov dx, ax
    call cursor
    
    mov dx, bx
    mov ah, 09h   
    int 21h
    ret
mostrar endp

imprimir proc near
    mov dx, ax
    mov ah, 09h
    int 21h
    ret
imprimir endp

digitar proc near
    mov ah, 07h
    int 21h
    mov [si], al
    ret
digitar endp

limpiar proc near
    mov ax, 0600h
    mov bh, 79h
    mov cx, 0h
    mov dx, 184fh
    int 10h
    ret
limpiar endp

cursor proc near
    mov ah, 2h
    mov bh, 0h
    int 10h
    ret
cursor endp

guardar proc near
    mov ax, [si]
    sub ax, 30h
    mov [di], ax
    ret  
guardar endp    