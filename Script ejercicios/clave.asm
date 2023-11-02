page 60,132
title clave.exe
.model small
.stack 64
.data
    clave db 5 dup(' ')
    titulo db 'CLAVE?', '$'
    nombre db 'aaaaa', '$'
    correc db 'CLAVE CORRECTA',  '$' 
    incorr db 'CLAVE INCORRECTA' , '$'
    ast db '*', '$'
.code

inicio proc far
    mov ax,@data
    mov ds,ax
    
    call limpiar
    call cursor
    call prompt
    call captura
    cmp clave, ' '
    je salir
    call comparar
    salir:
    mov ax, 4c00h
    int 21h
inicio endp

limpiar proc near
    mov ax, 0600h
    mov bh, 71h
    mov cx, 0000h
    mov dx, 184fh
    int 10h
    ret
limpiar endp

cursor proc near
    mov ah, 02h
    mov bh, 00h
    mov dx, 0505h
    int 10h
    ret
cursor endp

prompt proc near
    mov ah, 09h
    lea dx,titulo
    int 21h
    ret     
prompt endp

captura proc near
    mov di, 5
    mov si, 0
    mov dx, 050bh
        ciclo:
        mov ah, 07h
    int 21h
        cmp al,0dh
        je tl
        mov clave[si], al
        mov ah, 02h
        mov bh, 00h
        int 10h
        mov ah, 09h
        mov bx, dx
        lea dx, ast
        int 21h
        mov dx,bx
        inc si
        inc dl
        dec di
        jnz ciclo
    tl: ret
captura endp
        
comparar proc near
    mov cx, 5
    lea si, clave
    lea di, nombre
        a1:
    mov al, [si]
    cmp al, [di]
    jne a2
    inc si 
    inc di
    dec cx
    jnz a1
    call limpiar
    mov ah, 09h
    lea dx, correc
    int 21h
    call pausa
    jmp salir
        a2:
        call limpiar
    mov ah,09h
        lea dx,incorr
        int 21h
        call pausa
        ret
comparar endp                     

pausa proc near
    mov ah, 07h
    int 21h
    ret
pausa endp    