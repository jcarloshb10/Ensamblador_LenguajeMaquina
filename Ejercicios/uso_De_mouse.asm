page 60,132
title interrupcion 33h manejo de mouse
.model small
.stack 64
.data

;-------------------------------------

izquierd  db 'se ha presionado el boton izquierdo',13,10,'$'
derech db 'se ha presionado el boton derecho',13,10,'$'
rueda db 'se ha presionado el scroll',13,10,'$'  


;-------------------------------------

cuadroi db 13,10,'===========================================',13,10, 

titulo db 13,10,'** implementacion interrupcion 33h **',13,10, 

mensaje db 13,10,'1.mouse buttons',13,10,
mensaje01 db 13,10,'2.salir',13,10,
                                                                                                                           
cuadrof db 13,10,'===========================================',13,10,                                                              
                                                              
newline2 db 13,10,'                                       ',13,10,
  
ingresar db '==> ingrese su opcion:  ', '$'
                                                                                    
;-------------------------------------------------------------                                              
.code  
inicio:          

 mov ax,@data;llamar a .data  
 mov ds,ax   ;guardar los datos en ds
 mov es,ax
 
 lea dx,cuadroi;imprimir mensaje
 mov ah,9h
 int 21h
 ;---------------------------------------------------
 mov ah,08;pausa y espera a que el usuario precione una tecla
 int 21h  ;interrupcion para capturar
 cmp al,49
 je opc1  ;saltar si es igual
 cmp al,50       
 je opc2 
     
 je  salir
 mov ax,4c00h;funcion que termina el programa
 int 21h

opc1:

 call opcion1;llama al procedimiento

opc2:
 call opcion2;llama al procedimiento
;___________________ 


opcion1 proc near 
    
 call limpiartot   
 mov ah, 0;limpia el registro
 mov al,3h
 int 10h;llamada a la interrupcion de la bios 10h 
 
 
  mov  ax, 00h;Inicializa el controlador del mouse.
  int  33h

  mov  ax, 01h;Mostrar el cursor en pantalla.
  int  33h  

mientras:  ;Repite el proceso cada vez que presiona una tecla del mouse .                   
;captura la tecla que se ha presionado. 

  mov  ax, 03h
  int  33h        ;Esta interrupcion retorna en bx.
  
;comprueba el estado del boton izquierdo. 

  mov  ax, bx              ;mueve el dato que esta en ax a bx.
  and  ax, 001b                 ;Se compara ax con el binario, si es igual retorna 1, para indicar que se ha presionado click izquierdo
  jz   comprobar_izq       ;Se comprueba si se ha presionado click izquierdo.
  mov  ah, 9h      
  lea  dx, izquierd;             Muestra el mensaje del click izquierdo
  int  21h
comprobar_izq: 

;comprueba el estado del click derecho.
  mov  ax, bx   ;mueve el dato que esta en ax a bx.
  and  ax, 010b ;Se compara ax con el binario, si es igual retorna 2, para indicar que se ha presionado click derecho 
  jz   comprobar_der    ;Se comprueba si se ha presionado click derecho.
  mov  ah, 9h      
  lea  dx, derech   ; Muestra el mensaje del click derecho
  int  21h
comprobar_der: 

;comprueba el estado del scroll.
  mov  ax, bx   ;mueve el dato que esta en ax a bx.
  and  ax, 100b ;Se compara ax con el binario, si es igual retorna 4, para indicar que se ha presionado scroll.
  jz   comprobar_rue    ;Se comprueba si se ha presionado click derecho.
  mov  ah, 9h      
  lea  dx, rueda
  int  21h
comprobar_rue: 


;Verifica si se ha presionado Enter para regresar al menu.
  mov  ah, 0bh
  int  21h                                     
  cmp  al, 0    ;Si no se ha presionado ningun boton del mouse, no se termina el proceso
  jz   mientras

 
 mov ah,08;pausa y espera a que el usuario precione una tecla
 int 21h;interrupcion para capturar
 
 
 call oculta_mouse
 call limpiartot
 call cursor
 call inicio 
 
 
 opcion1 endp 

;___________________________
                    
opcion2 proc near
    
salir:
mov  ah,04ch
int  21h  
ret  

opcion2 endp 

;__________________________ 

;limpiador para usar en cualquier funcion          
limpiartot proc near
             
mov ax, 0600h ;limpiar pantalla
mov bh, 7h    ;blanco fondo, azul caracteres
mov cx, 0000h ;inicio pantalla
mov dx, 184fh ;fin pantalla
int 10h
ret  

limpiartot endp 
    
     
cursor proc near 
     
mov ah, 02h ;colocar cursor
mov bh, 00 ;pagina 0
mov dh, 00;fila
mov dl, 01 ;columna
int 10h 
ret    
    
cursor endp   

oculta_mouse proc near   ;ocultar mouse 
    
mov ax, 02h
int 33h
ret      

oculta_mouse endp
                     
end inicio


