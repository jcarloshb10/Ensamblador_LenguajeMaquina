PAGE 60,132
TITLE ejemplo
.MODEL small
.STACK 64
.CODE 
INICIO PROC FAR
    
     MOV AX,0O ; INICIALIZA EL MOUSE
     INT 33h
     ;MOV AX,01 ; MOSTRAR APUNTADOR EN PANTALLA
     ;INT 33h
     MOV AX,02 ; NO MOSTRAR APUNTADOR EN PANTALLA
     INT 33h       
            
    ;descomentar para ver la funcion ax,01 en ejecucion  
    
    mov AX,4C00H
    int 21H
INICIO ENDP
END

;AX=0 Activar / desactivar rat�n.
;AX=1 Ver puntero
;AX=2 Ocultar puntero
;AX=3 LEE POSICI�N Y ESTADOS DEL BOT�N
          ;BX= Para 2 � 3 botones BX Devuelve el bot�n pulsado: 0 izq, 1 der, 2 cent. Los botones 3 al 15... como que no se usan mucho.
          ;CX= Coord. x del puntero en pixels.
          ;DX= Coord. y.
;AX=4 Fija posici�n
;AX=5 Lee la informaci�n.
