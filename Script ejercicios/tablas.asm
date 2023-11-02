page 60,132
title eje 
.model small
.stack 64
.data      
datos label byte 
maxlon db 20
actlon db ? 
mensaje db 'Posicion: $'
tabla1 db 'ene'
       db 'feb'
       db 'mar'
       db 'abr'
       db '$  '
       
mostrar 3 dup (' ')         
cardig 20 dup(' ')
var3 db 00h
pos db ' '  

.code
inicio proc far 
    mov ax, @data
    mov ds,ax
    mov es, ax    
    
    call cursor 
    call llenar
    call fin
    call mostrarDatos
   
    mov ax,4c00h
    int 21h
inicio endp    

mostrarLabel proc near 
    mov ah,09h 
    mov al,pos
    mov mensaje+10,al
    lea dx, mensaje
    int 21h
    ret
mostrarLabel endp  

mostrarDatos proc near 
    mov ah,09h
    lea dx,mostrar
    int 21h
    ret
mostrarDatos endp

llenar proc near   
    mov di, 03h   
    lea si,tabla1[di]      
    mov di,00h
    for:   
    mov al,[si]
    mov mostrar[di],al  
    inc di    
    inc si
    cmp di,03h  
    jne for     
    mov mostrar[di],'$'
    ret
llenar endp

fin proc near
    mov bh,00h
    mov bl,03h
    mov dup[bx+1], '$'
    ret 
fin endp

cursor proc near
    mov ah,02h
    mov bh,00     
    mov dh,var3
    mov dl,00
    int 10h 
    add var3,02
    ret 
cursor endp                       
    
end 