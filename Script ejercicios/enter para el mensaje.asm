    title variables
    .model small
    .stack 64
    .data
      prueba db 50 dup ("$")      
    .code                   
    

    inicio proc far
    mov ax,@data
    mov ds,ax
    
    mov si,0 ; inicia el registro indice en 0
    
    ciclo:
    mov ah,07h; permite entrada de un caracter
    int 21h    ; y lo almacena en al
    
    mov prueba[si],al;agrega el caracter en al  a prueba
    inc si
    
    cmp al,13
    jne ciclo
    
    mov prueba[si],"$"  ; agrega el fin de cadena
    
    mov ah,09
    mov dx, offset prueba
    int 21h
    mov ax,4ch
    int 21h
    
     
         
         
         
    
    inicio endp
    end