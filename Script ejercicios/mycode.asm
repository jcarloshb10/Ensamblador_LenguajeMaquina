.model small
.stack 64
. data
    var1 db 'hola','$'
    var2 db 'adios','$'
.code
inicio proc far
    mov ax,@data
    mov ds,ax  
    
    color proc near
        mov ax,0600h
        mov bh,71h
        mov cx,0000
        mov dx,184fh
        int 10h
        ret
    color end
    
    cursor proc near
        mov ah,02
        mov bh,00
        int 10h
        ret
    cursor endp
    
    cadena proc near
        mov ah,09
        int 21h
        ret
    cadena endp
    
    
    mov ax,4c00h
    int 21h
inicio end
