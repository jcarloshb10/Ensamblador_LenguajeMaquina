PAGE 60,132
TITLE EJE
.MODEL SMALL
.STACK 64
.DATA 
VAR1 db 'HOLA','$'
VAR2 db 'COMO ESTAS','$'
.CODE
INICIO PROC FAC
    MOV AX,@data
    MOV DS,AX
    
    CALL COLOR
    MOV DX,0505H
    CALL CURSOR
    LEA DX,VAR1
    CALL MOSTRAR
    MOV DX,0A05H
    CALL CURSOR
    LEA DX,VAR2
    CALL MOSTRAR
    
    MOV AX,4C00H
    INT 21H
INICIO ENDP

COLOR PROC NEAR
    MOV AH,06H
    MOV AL,00
    MOV BH,71H
    MOV CX,0000
    MOV DX,184FH
    INT 10H
    RET
COLOR ENDP

CURSOR PROC NEAR
    MOV AH,02H
    MOV BH,00
    INT 10H
    RET
CURSOR ENDP

MOSTRAR PROC NEAR
    MOV AH,09H
    INT 21H
    RET
MOSTRAR ENDP

