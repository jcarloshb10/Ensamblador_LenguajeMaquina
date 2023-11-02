
.model small
 org 100h
.stack 64h

.data

menu db "Seleccione una opcion:",13,10
     db "1. Nombre",13,10
     db "2. Edad",13,10
     db "3. Telefono",13,10
     db "4. Salir",13,10,'$'

.code
start:

;INICIALIZAR EL SEGMENTO DATA.
  mov  ax, @data
  mov  ds, ax

  call limpiar_pantalla      
  call mostrar_menu    

;ESPERAR POR UNA TECLA.    
  mov  ah, 7
  int  21h

;FINALIZAR PROGRAMA.
  mov  ax, 4c00h
  int  21h

;---------------------------------------------

mostrar_menu proc
  lea  dx,menu  
  ;ah,09h desplegar un mensaje en la pantalla (area de datos)
  mov  ah, 9
  int  21h
  ret
mostrar_menu endp

limpiar_pantalla proc
  mov  ah, 0
  mov  al, 3
  int  10H
  ret
limpiar_pantalla endp

end start




