page 60,132
title clave.exe
.model small
.stack 64
.data     
    clave db 20 dup(' ')  
    lineas db 20 dup(' ')
   
    titulo db 'Ingrese palabra a adivinar: ', '$'
    nombre db 'bartolomeo', '$'
    correc db ' CLAVE CORRECTA',  '$' 
    incorr db ' CLAVE INCORRECTA' , '$'
    palabra db 'Palabra a adivinar: ', '$'  
    letra db 'Ingresa letra: ', '$' 
    mens_int db ' intentos', '$'
    intento db 'Te queda ', '$' 
    blanco db '     ', '$'
    ast db '*', '$' 
    size DB ?  
    num_gan DB ?
    felic db 'Felicitaciones, ganaste!', '$'
    perd db 'Parece que perdiste, intenta de nuevo', '$' 
    inten db 1 dup(' ')
     
    
        dato1 LABEL BYTE
        MAXLON1 DB 2
        ACTLON1 DB ?           
        CARDIG1 DB 20 DUP (' ')
        REV1 DB 20 DUP (' ')
    repet DB ?
    band DB ?   
.code

inicio proc far
    mov ax,@data
    mov ds,ax
    
    call limpiar 
    
    
    mov dx, 0505h
    call cursor 
    lea dx,titulo
    call prompt
    
    
    
    
    
    
    
    
    
    call captura
    cmp clave, ' '
    je salir  
    
    
    call limpiar 
    
            MOV BX,00
            MOV CL,size
            
            ciclo2: 
                   
            mov lineas[BX], '-'
            inc bx       
            cmp bx,cx
          
            jnz ciclo2   
            
            dec bx
            mov lineas[BX], '$'
            MOV clave[BX],'$'
            
  
            MOV CX,0
            MOV BX,00
            MOV BL,size
            
            
     
            
            mov dx, 0505h
            call cursor 
            lea dx,palabra
            call prompt
            
                   
            MOV AH,09H
            LEA DX,lineas
            INT 21H 
            
            mov dx, 0805h
            call cursor
            lea dx,letra
            call prompt  
            
            mov repet, 3h  
            
            salto_largo:
            
            mov dx, 0814h
            call cursor
            LEA DX,dato1
            CALL DIGITAR  
            
            
            MOV BH,00
            MOV BL,ACTLON1 
            
            MOV CARDIG1[BX],'$'
            
            
            mov dx, 0805h
            CALL CURSOR
            MOV AH,09H
          
            
       
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

DIGITAR PROC NEAR
    MOV AH,0AH
    INT 21H
    RET
DIGITAR ENDP

cursor proc near
    
    mov ah, 02h
    mov bh, 00h    
    int 10h
    ret
cursor endp 

prompt proc near
    mov ah, 09h
    int 21h
    ret     
prompt endp

captura proc near
    mov di, 20h
    mov si, 0
    mov dx, 0521h
        ciclo:
        mov ah, 07h
    int 21h   
        inc size
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
    mov cl, size 
    mov bx, 0
    dec cl
    lea si, clave   
    lea di, cardig1
     
    
        a1: 
    
    mov al, [di]
    cmp al, [si]
    
    jne jump_line   
    
    mov lineas[BX], al 
     
     inc band 
     inc num_gan
     mov dl, num_gan
     inc dl
     cmp size, dl
     jnz saltar_ag
     
     mov dx, 1508h
     call cursor
     lea dx,felic
     call prompt 
     
     
     
     saltar_ag:
     cmp band, 2
     jge bandera
     inc repet 
    
    bandera:
    jump_line:
    inc bx
    inc si  
    
    dec cx
    jnz a1
    
    mov band, 0h 
    
    mov dx, 0519h
    call cursor
    MOV AH,09H
    LEA DX,lineas
    INT 21H   
                
    mov dx, 0814h            
    call cursor  
    lea dx,blanco
    call prompt 
    
    dec repet
    mov dx, 0530h
    call cursor
    lea dx, intento 
    call prompt 
                
                
   mov dl, repet  
   
     cmp dl, 0
     jnz saltar_ag2
     
     mov dx, 1508h
     call cursor
     lea dx,perd
     call prompt 
     
     
     
     saltar_ag2:
   
   
   
   add dl, 30H         
   mov inten[0], dl 
   mov inten[1], '$'
   
      
    
    lea dx, inten 
    
    call prompt  
    lea dx, mens_int
    call prompt 
     
    cmp repet, 0
    JNE salto_largo
    
    call pausa
    jmp salir 
    
    
        a2:    
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