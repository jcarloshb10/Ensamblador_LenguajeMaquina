.stack 64
.data           

datos label byte

maxlon db 20h           ; capacidad de la cadena  
actlon db ?             ; caracteres actuales de la cadena
cardig db 20 Dup(' ')   ; cadena con caracteres}

str1 db 'Primer numero: ', '$'
str2 db 'Segundo numero: ', '$'
str3 db 'La suma es: ', '$'
num1 db 00h
num2 db 00h
suma db 00h

.code
.startup
    call limpiar
    mov ax, 0205h
    lea bx, str1
    call mostrar
    call digitar
    
    lea si, cardig
    lea di, num1
    call guardar
    
    mov ax, 0405h
    lea bx, str2
    call mostrar
    call digitar
    
    lea si, cardig
    lea di, num2
    call guardar
    
    lea si, num1
    lea di, num2
    mov al, [si]
    add al, [di]
    mov ah, 00h
    mov cx, 0000h
    mov dl, 0ah
    div dl
    
    lea si, suma
    cmp al, 00
    jne mayor
    jmp menor
    
    menor:
        add ah, 30h
        mov [si], ah
        inc cx
        jmp final
    
    mayor:
        add al, 30h
        mov [si], al
        inc si
        inc cx
        jmp menor
    
    final:
        add si, cx
        mov [si], '$'

    call limpiar
    mov ax, 0205h
    lea bx, str3
    call mostrar
    lea ax, suma
    call imprimir
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
    mov ah, 0ah
    lea dx, datos
    int 21h
    ret
digitar endp

indicar proc near
    mov dh, 0ah
    mov dl, cl
    call cursor
    
    lea dx, num1  
    mov ah, 9h   
    int 21h
                 
    mov dh, 0ch
    mov dl, cl
    call cursor
    
    lea dx, num2 
    mov ah, 9h   
    int 21h
    
    ret
indicar endp

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