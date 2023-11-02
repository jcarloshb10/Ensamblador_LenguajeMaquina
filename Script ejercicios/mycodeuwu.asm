.stack 64
.DATA
datos label byte 
maxlon db 20
action db ?
carding db 20 dup ('')

var1 db 'Digite su nombre: ','$'
var2 db 'Digite su direccion: ' ,'$'
.code 
.startup
    mov es,ax
    call limpiar
    mov dx,0000h
    call cursor
    call mostrar
    call digitar 
    call cursor
    call mostrar2
    call digitar2
    call limpiar
    call fin 
    call indicar 
    
    mov ax,4c00h
    int 21h    
    
.exit

    mostrar proc near
        mov ah,09h
        lea dx,var1
        int 21h
        ret
    mostrar endp
    
    digitar proc near 
        mov ah,0ah
        lea dx,datos
        int 21h
        ret
    digitar endp 
    
    mostrar2 proc near
        mov ah,19h
        lea dx,var2
        int 21h
        ret
    mostrar2 endp
    
    digitar2 proc near
        mov ah,1ah
        mov dx,datos
        int 21h
        ret
    digitar2 endp
    
    fin proc near
        mov bh,00h
        mov bl,action
        mov carding [bx+1],'$'
    fin endp
    
    indicar proc near 
        mov dl,05h
        mov dh,05h
        call cursor 
        mov ah,09h
        lea dx,carding
        int 21h
        ret
    indicar endp
    
    limpiar proc near
        mov ax,0600h
        mov bh,30h
        mov cx,0000h
        mov dx,148Fh
        int 10h
        ret
    limpiar endp
    
    cursor proc near
        mov ah,02h
        mov bh,00h
        int 10h
        ret
    cursor endp
END
    
    



