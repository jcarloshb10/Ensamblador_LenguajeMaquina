TITLE CLAVE.EXE
.MODEL SMALL
.STACK 64 
.DATA
CLAVE DB 5 DUP('')
TITULO DB 'CLAVE?','$'
NOMBRE DB 'DDDDD','$'
CORREC DB 'CLAVE CORRECTA','$'
INCORRE DB 'CLAVE INCORRECTA','$'
AST DB  '*','$'
.CODE 
INICIO PROC FAR
    MOV AX,@DATA 
    MOV DS,AX
    CALL LIMPIAR
    CALL CURSOR
    CALL PROMPT
    CALL CAPTURA
    CMP CLAVE, ' '
    JE SALIR
    CALL COMPARAR
    SALIR: MOV AX,4C00H
    INT 21H
    INICIO ENDP
LIMPIAR PROC NEAR
    MOV AX,0600H
    MOV BH,71H
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
    RET
    LIMPIAR ENDP
CURSOR PROC NEAR
    MOV AH,02H
    MOV BH,00
    MOV DX,0505H
    INT 10H
    RET
    CURSOR ENDP
PROMPT PROC NEAR 
    MOV AH,09H
    LEA DX,TITULO
    INT 21H
    RET
    PROMPT ENDP
CAPTURA PROC NEAR
    MOV DI,5 ;controla dddd
    MOV SI,0
    MOV DX,050BH; posicion cursor para clave
    CICLO: MOV AH,07H;entrada por teclado sin repeticion
    INT 21H
    CMP AL,0DH; compara si se digito enter
    JE TI
    MOV CLAVE [SI],AL  ;inicia con la primera letra clave
    MOV AH,02H
    MOV BH,00
    MOV BL,71H
    INT 10H
    MOV AH,09H; muestra por pantalla
    MOV BX,DX;cordenada del cursor
    LEA DX,AST;y remplaza el caracter por *
    INT 21H
    MOV DX,BX ; restaura el caracter
    INC SI ;controla las detras de la clave
    INC DI ; incrementa posicion cursor-columna
    DEC DI ;controla el ciclo si llega a cero
    JNZ CICLO   ;jnz 
    TI: RET
    CAPTURA ENDP
COMPARAR PROC NEAR
    MOV BX,CX
    MOV CX,5
    LEA SI,CLAVE;lo que digito
    LEA DI,NOMBRE;ddddd
    A1:
    MOV AL,[SI];compara letra por letra
    CMP AL,[DI]
    JNE A2; si no es igual una letra salta
    INC SI;si es igual verifica la siguiente
    INC DI
    DEC CX; decrementa el contador
    JNZ A1       ;jnz
    CALL LIMPIAR  
    MOV AH,09H
    LEA DX,CORREC ;correc
    INT 21H
    CALL PAUSA
    JMP SALIR
    A2: CALL LIMPIAR
    MOV AH,09H
    LEA DX,INCORRE ; incorre 
    INT 21H
    CALL PAUSA
    RET
    COMPARAR ENDP
PAUSA PROC NEAR
    MOV AH,07H
    INT 21H
    RET   
    PAUSA ENDP
END