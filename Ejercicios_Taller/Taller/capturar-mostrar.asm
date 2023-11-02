.model small
;.stack 64
.data           
;
datos label byte
maxlon db 20h; capacidad de la cadena
actlon db ?; caracteres actuales de la cadena
cardig db 20 Dup(' '); cadena con caracteres
var1 db 'Digite su nombre: $'
var2 db 'Su nombre es: $' 
;
.code
.startup
;                             
    ;mov es, ax
    call limpiar
    call cursor
    call mostrar
    call digitar
    call limpiar
    call fin
    call intercambiar 
    call cursor
    call mostrar  
    call indicar
.exit
;         
mostrar proc near
    mov ah, 9h
    lea dx, var1
    int 21h
    ret
mostrar endp

digitar proc near
    mov ah, 0ah
    lea dx, datos
    int 21h
    ret
digitar endp

fin proc near
    mov bh, 0h
    mov bl, actlon
    mov cardig[bx+1],'$'
    ret
fin endp

indicar proc near
    ;call cursor
    mov ah, 9h
    lea dx, cardig
    int 21h
    ret
indicar endp

limpiar proc near
    mov ax, 0600h
    mov bh, 0f1h
    mov cx, 0h
    mov dx, 184fh
    int 10h
    ret
limpiar endp

cursor proc near
    mov ah, 2h
    mov bh, 0h
    mov dx, 0205h
    int 10h
    ret
cursor endp
             
intercambiar proc near
    lea si, var1
    lea di, var2
    mov cl, 0h
    ciclo:
        mov al, [si]
        mov bl, [di]
        mov [si], bl
        mov [di], al
        inc si
        inc di
        inc cl    
    cmp al, 24h
    je _fin
    cmp bl, 24h
    je _fin
    
    jmp ciclo
    _fin:
    ret
                 
intercambiar endp