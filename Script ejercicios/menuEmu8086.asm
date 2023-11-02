page 60,132
title definicion menu
.model small
org 100h
.stack 64  
.data
titulo db 13,10,'CAMBIAR FONDO DE PANTALLA',13,10,'$'

menu db '-Presione 0 para modo por default',13,10,'-Presione 1 para azul',13,10,'-Presione 2 para morado',13,10,'-Presione 3 para gris con letras negras',13,10,'Para salir, presione cualquier otra tecla',13,10,'$'
mensaje1 db 'Pantalla en color azul',13,10,'$'
mensaje2 db 'Pantalla en color morado',13,10,'$'
mensaje3 db 'Pantalla en color gris con letras negras',13,10,'$'

.code  

inicio:          ;Funcion
  ;--------------------------------------------------- 
 ;mov bh,0fh      ;0 color negro , f color de letra blanca
 ;mov cx,0000h    ;es la esquina superior izquierda reglon: columna
 ;mov dx,184Fh    ;es la esquina inferior derecha reglon: columna
 
 ;--------------------------------------------------
 mov ax,@data     ;llamar a .data
 mov ds,ax        ;guardar los datos en ds
 
 lea dx,titulo    ;imprimir el mensaje 
 mov ah,9h
 int 21h
 
 lea dx,menu   ;imprimir menu
 mov ah,9h
 int 21h
 ;---------------------------------------------------
 mov ah,08              ;pausa y espera a que el usuario precione una tecla
 int 21h                ;interrupcion para capturar
 cmp al,48              ;0,1,2,3
 je llamarDefault
 cmp al,49       
 je llamarAzul     
 cmp al,50        
 je llamarMorado   
 cmp al,51         
 je llamarGris   
 jmp fin

fin:
 mov ax,4c00h       ;funcion que termina el programa
 int 21h
 ;------------------------------------------------------
llamarDefault:
 CALL DEFAULT

llamarAzul:
 CALL AZULPROC      ;llama al procedimiento

llamarMorado:
 CALL MORADOPROC    ;llama  al procedimiento

llamarGris:
 CALL GRISPROC

DEFAULT PROC NEAR
 mov ah, 0      ;limpia el registro
 mov al,3h      ;modo de texto
 int 10h
 
 mov ax,0600h
 mov bh,07h
 mov cx,0000h
 mov dx,184Fh
 int 10h
  
 CALL inicio 
DEFAULT ENDP
                    
AZULPROC PROC NEAR
 mov ah,0
 mov al,3h
 int 10h
 
 mov ax,0600h
 ;bh atributo-color
 mov bh,1fh
 mov cx,0000h
 mov dx,184Fh
 int 10h
  
 lea dx,mensaje1 
 mov ah,9h
 int 21h
  
 CALL inicio
 RET
AZULPROC ENDP

MORADOPROC PROC NEAR
 mov ah,0
 mov al,3h
 int 10h
   
 mov ax,0600h
 mov bh,5fh
 mov cx,0000h
 mov dx,184Fh
 int 10h   
  
 lea dx,mensaje2  
 mov ah,9h
 int 21h
  
 CALL inicio
 RET
MORADOPROC ENDP

GRISPROC PROC NEAR
 mov ah,0
 mov al,3h
 int 10h  

 mov ax,0600h
 mov bh,80h
 mov cx,0000h
 mov dx,184Fh
 int 10h     

 lea dx,mensaje3
 mov ah,9h
 int 21h
  
 CALL inicio
 RET    
GRISPROC ENDP
end inicio   