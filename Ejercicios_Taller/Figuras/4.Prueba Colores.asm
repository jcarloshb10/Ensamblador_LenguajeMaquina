PAGE 60,132
TITLE EJE
.MODEL SMALL
.STACK 64
.DATA
.CODE
INICIO PROC FAC
    MOV AX,@data
    MOV DS,AX
    
    MOV AX,0013H ;Modo Grafico 12h: 640x480 16 COL  13h:320x200 256 COL
    INT 10H
    MOV CX,15h ;Columna 15
    MOV DX,15h ;Fila 15
    MOV AL,00H
    
    BANDERA: MOV AH,0CH ;Habilitar color de pixel
    INT 10H
                                                 
    INC CX
    CMP CX,50 ;Linea de 50 pixeles
    JE SIG
    JMP BANDERA
    
    SIG:MOV CX,15H
    INC DL
    INC DL
    INC AL
    CMP DX,100H
    JE FIN
    JMP BANDERA
     
    
    
    
    FIN: MOV AH,07H ;Espera INPUT
    INT 21H
    
    
    MOV AX,4C00H
    INT 21H
INICIO ENDP 