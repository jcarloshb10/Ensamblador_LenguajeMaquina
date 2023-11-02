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
    MOV DX,50h ;Fila 15
    
    MOV AL,09H
    SIG1: MOV AH,0CH 
    
    
    INC AL
    INT 10H  
                                                                    
    INC AH
    
    DEC CX
    INC DX
    CMP CX,0060H
    JE SIG2
    JMP SIG1 
    
    MOV AL,09H
    SIG2: MOV AH,0CH
    INC AL
    INT 10H
    
    DEC CX
    DEC DX
    CMP CX,0020H
    JE SIG3
    JMP SIG2
    
    MOV AL,09H
    SIG3: MOV AH,0CH
    INC AL
    INT 10H
    
    INC CX
    
    CMP CX,00A0H
    JE SIG4
    JMP SIG3  
    
    
    
    MOV CX,00A0h ;Columna 15
    MOV DX,50h ;Fila 15
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
  
    
    SIG4: MOV AH,0CH 
    MOV AL,00H
    
    
    INT 10H  
                                                                    
    INC AH
    
    DEC CX
    INC DX
    CMP CX,0060H
    JE SIG5
    JMP SIG4 
    
    
    SIG5: MOV AH,0CH
    MOV AL,00H
    INT 10H
    
    DEC CX
    DEC DX
    CMP CX,0020H
    JE SIG6
    JMP SIG5
    
    
    SIG6: MOV AH,0CH
    MOV AL,00H
    INT 10H
    
    INC CX
    
    CMP CX,00A0H
    JE mouse
    JMP SIG6  
   
           
           
    mouse: 
    mov cx, 03h
    mov ax, 3
    int 33h     
    cmp bx, 01
    JE FIN
    cmp cx, 04h
    jmp mouse
    
    
    
    
    
    
    
    
    
    
    FIN: 
    
    MOV AX,4C00H
    INT 21H
INICIO ENDP 