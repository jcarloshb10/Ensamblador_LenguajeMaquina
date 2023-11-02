.stack 64
.data           
;
datos label byte

maxlon db 20h; capacidad de la cadena  
actlon db ?; caracteres actuales de la cadena
cardig db 20 Dup(' '); cadena con caracteres}

var1 db 'Primer numero: $'
var2 db 'Segundo numero: $'  

num1 db 20 Dup(' ')
num2 db 20 Dup(' ')
;
.code
.startup
;mov es, ax 

    call limpiar 
    mov ch, 2h
    call mostrar      
    
    mov dx, 0213h
    call digitar 
    
    lea si, num1
    lea di, cardig
    
    mov dx, 0414h
    call digitar
             
    lea si, num2
    lea di, cardig
                
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