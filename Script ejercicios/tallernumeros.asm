.stack 64
.data      
mostrarMenu  db '+-----------------------+',13,10
             db '| taller computacion    |',13,10 ; 13 es un 'enter' 10 un espacio
             db '|                       |',13,10
             db '|Universidad de Narino  |',13,10
             db '+---------MENU----------+',13,10
             db '|    ingrese numero     |',13,10   
             db '+-----------------------+',13,10,13,10
             db 'Ingrese un Numero :--> $',13,10  
             
mensaje db 13,10,'Presione "ESC" para volver a menu$',13,10 
         
mensaje1 db 'cero  ','uno   ','dos   ', 'tres  ','cuatro','cinco ','seis  ','siete ','ocho  ','nueve '
mensaje2 db 10 DUP (' '),'$'

   
.code  

.startup
    call limpiar
    call cursor
    call menu 
    
.exit

limpiar proc near
    mov ax,0600h  
    mov bh,0fh    ;negro(0),blanco(f)
    mov cx,0000   ;esquina superior izq
    mov dx,18f4h  ;esquina inferior der
    int 10h
    ret
    limpiar endp

cursor proc near
    mov ah,02h  ;Posicionar el cursor
    mov bh,00
    mov dh,00   ;Fila
    mov dl,00   ;Columna
    int 10h
    ret
    cursor endp

vermenu proc near 
    mov ah,09
    lea dx,mostrarMenu ;Texto del menu
    int 21h
    ret
    vermenu endp

menu proc near 
    mov ah,0  ;modo video
    mov al,3h ;modo texto 
    int 10h
 
    call vermenu     

    mov ah,08 ;pausa y captura de datos en al
    int 21h
              
    ;-----------------Seleccion--------------------------- 
    ;                  (ASCII)
    cmp al,48 ;Si op 0
    je op0
    
    cmp al,49 ;Si op 1
    je op1

    cmp al,50 ;Si op 2
    je op2

    cmp al,51 ;Si op 3
    je op3

    cmp al,52 ;Si op 4
    je op4
     
    cmp al,53 ;Si op 5
    je op5
    
    cmp al,54 ;Si op 6
    je op6
    
    cmp al,55 ;Si op 7
    je op7
    
    cmp al,56 ;Si op 8
    je op8
    
    cmp al,57 ;Si op 9
    je op9 
     
    
    ;Fuera del rango
    cmp al,49
    jb call menu 
    cmp al,52
    ja call menu
    
    op0: call opt0
    op1: call opt1
    op2: call opt2
    op3: call opt3
    op4: call opt4 
    op5: call opt5
    op6: call opt6
    op7: call opt7
    op8: call opt8
    op9: call opt9
    mov ax,4c00h
    int 21h
     
    ret
    menu endp

opt0 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia0:  mov al,[si]
    mov [di],al
    inc si
    inc di
    loop copia0
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt0 endp

opt1 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia:  mov al,[si+6]
    mov [di],al
    inc si
    inc di
    loop copia
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt1 endp

opt2 proc near
    call limpiar
    call cursor
    
    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia1:  mov al,[si+12]
    mov [di],al
    inc si
    inc di
    loop copia1
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
 
    
    mov ah,08 ;pausa y captura de datos
    int 21h 
          
    cmp al,27 ;ascii de esc
    je call menu
    
    ret
    opt2 endp

opt3 proc near
    call limpiar
    call cursor
    
    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia2:  mov al,[si+18]
    mov [di],al
    inc si
    inc di
    loop copia2
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
    
    mov ax,4c00h
    int 21h
    ret
    opt3 endp

opt4 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia4:  mov al,[si+24]
    mov [di],al
    inc si
    inc di
    loop copia4
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt4 endp

opt5 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia5:  mov al,[si+30]
    mov [di],al
    inc si
    inc di
    loop copia5
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt5 endp

opt6 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia6:  mov al,[si+36]
    mov [di],al
    inc si
    inc di
    loop copia6
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt6 endp 

opt7 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia7:  mov al,[si+42]
    mov [di],al
    inc si
    inc di
    loop copia7
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt7 endp

opt8 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia8:  mov al,[si+48]
    mov [di],al
    inc si
    inc di
    loop copia8
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt8 endp

opt9 proc near
    call limpiar
    call cursor   

    lea si,mensaje1
    lea di,mensaje2
    mov cx,6
    copia9:  mov al,[si+54]
    mov [di],al
    inc si
    inc di
    loop copia9
    
    mov ah,09 
    lea dx,mensaje2
    int 21h
     
    mov ah,09 
    lea dx,mensaje
    int 21h
    
    mov ah,08 ;pausa y captura de datos
    int 21h
    cmp al,27
    je call menu
     
    ret  
    opt9 endp
