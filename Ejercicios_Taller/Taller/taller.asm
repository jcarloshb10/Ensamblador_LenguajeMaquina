.stack 64
.data           
;
datos label byte

maxlon db 20h; capacidad de la cadena  
actlon db ?; caracteres actuales de la cadena
cardig db 20 Dup(' '); cadena con caracteres}

var1 db 'Nombre: $'
var2 db 'Direccion: $'  

nombre db 20 Dup(' ')
direccion db 20 Dup(' ')
;
.code
.startup
;mov es, ax 

    call limpiar 
    mov ch, 2h
    call mostrar      
    
    mov dx, 0210h
    call digitar 
    
    lea si, nombre
    lea di, cardig
    call intercambiar
    
    mov dx, 0410h
    call digitar
             
    lea si, direccion
    lea di, cardig
    call intercambiar
                
    mov ax, 0050h
    sub al, actlon
    mov bh, 2h
    div bh    
    mov cx, ax        
    
    call indicar
.exit
;         
mostrar proc near 
    mov dx, 0205h
    call cursor
    
    lea dx, var1  
    mov ah, 9h   
    int 21h
           
    mov dx, 0405h
    call cursor
    
    lea dx, var2 
    mov ah, 9h   
    int 21h
    ret
mostrar endp

digitar proc near
    call cursor
    
    mov ah, 0ah
    lea dx, datos
    int 21h   
    call fin
    ret
digitar endp

fin proc near
    mov bh, 0h
    mov bl, actlon
    mov cardig[bx+1],'$' 
    mov actlon, 0h
    ret
fin endp

indicar proc near
    mov dh, 0ah
    mov dl, cl
    call cursor
    
    lea dx, nombre  
    mov ah, 9h   
    int 21h
                 
    mov dh, 0ch
    mov dl, cl
    call cursor
    
    lea dx, direccion 
    mov ah, 9h   
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
    int 10h
    ret
cursor endp
             
intercambiar proc near
    mov cl, 0h
    ciclo:
        mov al, [si]
        mov bl, [di]
        mov [si], bl
        mov [di], al
        inc si
        inc di
        inc cl    
    ;cmp al, 24h
    ;je _fin
    cmp bl, 24h
    je _fin
    
    jmp ciclo
    _fin:
    ret
intercambiar endp