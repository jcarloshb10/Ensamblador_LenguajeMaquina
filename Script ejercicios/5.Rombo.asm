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
    MOV CX,00A0h ;Columna 15
    MOV DX,15h ;Fila 15 
    
    
    BANDERA: MOV AH,0CH ;Habilitar color de pixel
    MOV AL,09H ;Color 0=BLACK 1=BLUE 2=GREEN 3=CYAN 4=RED 5=MAGENTA 6=BROWN 7=LIGHT GRAY 8=DARK GRAY 9=LIGHT BLUE A=LIGHT GREEN
    INT 10H
                                                 
    INC CX
    INC DX
    CMP CX,00D2H ;Linea de 50 pixeles
    JE SIG1
    JMP BANDERA
    
    SIG1: MOV AH,0CH
    MOV AL,05H
    INT 10H
    
    DEC CX
    INC DX
    CMP CX,00A0H
    JE REGRESO
    JMP SIG1 
    
    REGRESO: MOV AH,0CH
    MOV AL,0AH
    INT 10H
     
    DEC CX
    CMP CX,005FH
    JE SIG2
    JMP REGRESO
    
    SIG2: MOV AH,0CH
    MOV AL,03H
    INT 10H
    
    DEC CX
    DEC DX
    CMP CX,002DH
    JE SIG3
    JMP SIG2
    
    SIG3: MOV AH,0CH
    MOV AL,07H
    INT 10H
    
    INC CX
    DEC DX
    CMP CX,005FH
    JE Ida
    JMP SIG3 
    
    Ida: MOV AH,0CH
    MOV AL,04H
    INT 10H 
    INC CX
    CMP CX,00A0h
    JE Fin
    JMP Ida
    
    FIN: 
    MOV AH,07H ;Espera INPUT
    INT 21H
    
    
    MOV AX,4C00H
    INT 21H
    
 
    
    
INICIO ENDP    
