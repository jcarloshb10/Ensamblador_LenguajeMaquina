page 60,132
title clave.exe
.model small
.stack 64
.data     
    clave db 10 dup(' ')  
    lineas db 10 dup(' ')
   
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

    mun1a db ' ___________.._______', '$'
    mun1b db '| .__________))______|', '$'
    mun1c db '| | / / ', '$'
    mun1d db '| |/ / ', '$'
    mun1e db '| | /  ', '$'
    mun1f db '| |/', '$'
    mun1g db '| |', '$'
    mun1h db '| |', '$'
    mun1i db '| |', '$'
    mun1j db '| |', '$'
    mun1k db '| |', '$'
    mun1l db '| |', '$'
    mun1m db '| |', '$'
    mun1n db '| |', '$'
    mun1o db '| |', '$'
    mun1p db '| |', '$'
    mun1q db '| |', '$'
    mun1r db '| |', '$'
    mun1s db '""""""""""|_        |"""|', '$'
    mun1t db '""""""""""|_        |"""|', '$'
    mun1u db '| |        \ \        | |', '$' 
    
    mun2a db '| | / /      ||', '$'
    mun2b db '| |/ /       ||', '$'
    mun2c db '| | /        ||.-''.', '$'
    mun2d db '| |/         |/  _  \', '$'
    mun2e db '| |          ||  `/,|', '$'
    mun2f db '| |          (\\`_./', '$'
    
    mun3a db '| |         .-`-- .', '$'
    mun3b db '| |        /Y . . Y\', '$'
    mun3c db '| |       // |   | \\', '$'
    mun3d db '| |      //  | . |  \\', '$'
    mun3e db '| |     ()   |   |   ()', '$'
    
    mun4a db '| |          ||-||', '$'
    mun4b db '| |          || ||', '$'
    mun4c db '| |          || ||', '$'
    mun4d db '| |          || ||', '$'
    mun4e db '| |         / | | \', '$'
    mun4f db '""""""""""|_`-' `-' |"""|', '$'
    
    dato1 LABEL BYTE
    MAXLON1 DB 2
    ACTLON1 DB ?           
    CARDIG1 DB 10 DUP (' ')
    REV1 DB 10 DUP (' ')
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
    
    call dibujar

    mov bx,00
    mov cl,size
    
    ciclo2: 
           
    mov lineas[bx], '-'
    inc bx       
    cmp bx,cx
  
    jnz ciclo2   
    
    dec bx
    mov lineas[bx], '$'
    mov clave[bx],'$'
    
    mov cx,0
    mov bx,00
    mov bl,size
    
    mov dx, 0505h
    call cursor 
    lea dx,palabra
    call prompt
           
    mov ah,09h
    lea dx,lineas
    int 21h 
    
    mov dx, 0805h
    call cursor
    lea dx,letra
    call prompt  
    
    mov repet, 3h  
    
    salto_largo:
    
    mov dx, 0814h
    call cursor
    lea dx,dato1
    call digitar  
     
    mov bh,00
    mov bl,actlon1 
    
    mov cardig1[bx],'$'
    
    mov dx, 0805h
    call cursor
    mov ah,09h
 
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

digitar proc near
    mov ah,0ah
    int 21h
    ret
digitar endp

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

dibujar2 proc near  
    
    mov dx, 0430h
    call cursor 
    lea dx,mun2a
    call prompt 
    
    mov dx, 0530h
    call cursor 
    lea dx,mun2b
    call prompt 
    
    mov dx, 0630h
    call cursor 
    lea dx,mun2c
    call prompt 
    
    mov dx, 0730h
    call cursor 
    lea dx,mun2d
    call prompt 
    
    mov dx, 0830h
    call cursor 
    lea dx,mun2e
    call prompt 
    
    mov dx, 0930h
    call cursor 
    lea dx,mun2f
    call prompt 

    ret     
dibujar2 endp

dibujar1 proc near
    
    mov dx, 0a30h
    call cursor 
    lea dx,mun3a
    call prompt
    
    mov dx, 0b30h
    call cursor 
    lea dx,mun3b
    call prompt
    
    mov dx, 0c30h
    call cursor 
    lea dx,mun3c
    call prompt
    
    mov dx, 0d30h
    call cursor 
    lea dx,mun3d
    call prompt
    
    mov dx, 0e30h
    call cursor 
    lea dx,mun3e
    call prompt 
       
    ret     
dibujar1 endp 

dibujar0 proc near 
    
    mov dx, 0f30h
    call cursor 
    lea dx,mun4a
    call prompt
    
    mov dx, 1030h
    call cursor 
    lea dx,mun4b
    call prompt
    
    mov dx, 1130h
    call cursor 
    lea dx,mun4c
    call prompt
    
    mov dx, 1230h
    call cursor 
    lea dx,mun4d
    call prompt
    
    mov dx, 1330h
    call cursor 
    lea dx,mun4e
    call prompt
    
    mov dx, 1430h
    call cursor 
    lea dx,mun4f
    call prompt
   
    ret     
dibujar0 endp 


dibujar proc near
    
    mov dx, 0230h
    call cursor 
    lea dx,mun1a
    call prompt 
    
    mov dx, 0330h
    call cursor 
    lea dx,mun1b
    call prompt
    
    mov dx, 0430h
    call cursor 
    lea dx,mun1c
    call prompt
    
    mov dx, 0530h
    call cursor 
    lea dx,mun1d
    call prompt
    
    mov dx, 0630h
    call cursor 
    lea dx,mun1e
    call prompt
    
    mov dx, 0730h
    call cursor 
    lea dx,mun1f
    call prompt
    
    mov dx, 0830h
    call cursor 
    lea dx,mun1g
    call prompt
    
    mov dx, 0930h
    call cursor 
    lea dx,mun1h
    call prompt
    
    mov dx, 0a30h
    call cursor 
    lea dx,mun1i
    call prompt
    
    mov dx, 0b30h
    call cursor 
    lea dx,mun1j
    call prompt
    
    mov dx, 0c30h
    call cursor 
    lea dx,mun1k
    call prompt
    
    mov dx, 0d30h
    call cursor 
    lea dx,mun1l
    call prompt
    
    mov dx, 0e30h
    call cursor 
    lea dx,mun1m
    call prompt
    
    mov dx, 0f30h
    call cursor 
    lea dx,mun1n
    call prompt
    
    mov dx, 1030h
    call cursor 
    lea dx,mun1o
    call prompt
    
    mov dx, 1130h
    call cursor 
    lea dx,mun1p
    call prompt
    
    mov dx, 1230h
    call cursor 
    lea dx,mun1q
    call prompt
    
    mov dx, 1330h
    call cursor 
    lea dx,mun1r
    call prompt
    
    mov dx, 1430h
    call cursor 
    lea dx,mun1s
    call prompt
    
    mov dx, 1530h
    call cursor 
    lea dx,mun1t
    call prompt
    
    mov dx, 1630h
    call cursor 
    lea dx,mun1u
    call prompt
    
    ret     
dibujar endp

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
    
    mov lineas[bx], al 
    
    inc band 
    inc num_gan
    mov dl, num_gan
    inc dl
    cmp size, dl
    jnz saltar_ag 
    
    mov dx, 0519h
    call cursor
    mov ah,09h
    lea dx,lineas
    int 21h
    
    mov dx, 1505h
    call cursor
    lea dx,felic
    call prompt 
    
    call pausa
    jmp salir 
    
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
    mov ah,09h
    lea dx,lineas
    int 21h   
        
    mov dx, 0814h            
    call cursor  
    lea dx,blanco
    call prompt 
    
    dec repet  
    
    cmp repet, 2
    jnz sal_dib2
    call dibujar2
    sal_dib2:
    
    cmp repet, 1
    jnz sal_dib1
    call dibujar1
    sal_dib1:
    
    cmp repet, 0
    jnz sal_dib0
    call dibujar0
    sal_dib0:
    
    mov dx, 0e10h
    call cursor
    lea dx, intento 
    call prompt 
               
    mov dl, repet  
    
    cmp dl, 0
    jnz saltar_ag2   
    
    add dl, 30h         
    mov inten[0], dl 
    mov inten[1], '$'
    
    lea dx, inten 
    
    call prompt  
    lea dx, mens_int
    call prompt 
    
    mov dx, 1505h
    call cursor
    lea dx,perd
    call prompt
    
    call pausa
    jmp salir   
 
    saltar_ag2:
    
    add dl, 30h         
    mov inten[0], dl 
    mov inten[1], '$'
    
    lea dx, inten 
    
    call prompt  
    lea dx, mens_int
    call prompt 
    
    cmp repet, 0
    jne salto_largo
    
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