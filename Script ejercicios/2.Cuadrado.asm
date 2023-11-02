PAGE 60,132
TITLE EJE
.MODEL SMALL
.STACK 64
.DATA
.CODE
INICIO PROC FAC
    MOV AX,@data
    MOV DS,AX
    
    MOV AX,0012H ;Modo Grafico 12h: 640x480 16 COL  13h:320x200 256 COL
    INT 10H
    MOV CX,15h ;Columna 15
    MOV DX,15h ;Fila 15
    
    BANDERA: MOV AH,0CH ;Habilitar color de pixel
    MOV AL,09H ;Color 0=BLACK 1=BLUE 2=GREEN 3=CYAN 4=RED 5=MAGENTA 6=BROWN 7=LIGHT GRAY 8=DARK GRAY 9=LIGHT BLUE A=LIGHT GREEN
    INT 10H
                                                 
    INC CX
    CMP CX,50 ;Linea de 50 pixeles
    JE SIGUIENTE
    JMP BANDERA
    
    SIGUIENTE:MOV AH,0CH
    MOV AL,09H
    INT 10H 
    INC DL
    CMP DL,50
    JE REGRESO
    JMP SIGUIENTE
    
    REGRESO: MOV AH,0CH
    MOV AL,09H
    INT 10H 
    DEC CX
    CMP CX,15H
    JE ARRIBA
    JMP REGRESO
    
    ARRIBA: MOV AH,0CH
    MOV AL,09H
    INT 10H 
    DEC DL
    CMP DL,15H
    JE FIN
    JMP ARRIBA
    
    
    
    FIN: ;CALL COLOR
    MOV AH,07H ;Espera INPUT
    INT 21H
    
    
    MOV AX,4C00H
    INT 21H
INICIO ENDP

COLOR PROC NEAR
    MOV CX,16H
    MOV DX,16H
    LINEA: MOV AH,0CH
    MOV AL,09H
    INT 10H
    
    INC CX
    CMP CX,49
    JE SIG
    JMP LINEA
    
    SIG: MOV CX,16H
    INC DL
    CMP DL,49
    JE TERMINAR
    JMP LINEA
    
    TERMINAR: RET
    

COLOR ENDP