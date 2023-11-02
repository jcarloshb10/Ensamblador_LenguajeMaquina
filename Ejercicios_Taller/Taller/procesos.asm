;page 60, 132
;title procs
;.model small
.stack 64
.data
;        
hola db 'Hola$'
adios db 'Adios$'  
cnt db ?
;
.code
.startup
;
    call color 
    mov cnt, 0h  

    ciclo:         
        mov dh, cnt   
        mov dl, 5h
        call cursor 
          
        lea dx, hola; lea: cargar cadenas
        call mostrar 
        inc cnt
                    
        mov dh, cnt
        mov dl, 5h
        call cursor 
        
        lea dx, adios
        call mostrar 
        inc cnt
    cmp cnt, 16h
    jbe ciclo     
    
    int 20h 
;
    color proc near
        mov ah, 6h
        mov al, 0h
        mov bh, 0f1h
        mov cx, 0h
        mov dx, 184fh
        int 10h
        ret
    color endp
    
    cursor proc near
        mov ah, 2h
        mov bh, 0h
        int 10h
        ret
    cursor endp      
    
    mostrar proc near
        mov ah, 9h
        int 21h 
        ret
    mostrar endp 
.exit