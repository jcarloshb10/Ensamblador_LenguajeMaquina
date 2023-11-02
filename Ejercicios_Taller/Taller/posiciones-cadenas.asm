;.model small
.stack 64
.data
;   
var1 db 'ab$'
var2 db 'cd$'
;
.code
.startup
;
    mov es, ax; es: segmento extra (cadenas caracteres)
    
    mov ah, var1+0
    mov bh, var2+0
    xchg ah, bh; intercambiar valores
    mov var1+0, ah
    mov var2+0, bh
    
    mov ah, var1+1
    mov bh, var2+1
    xchg ah, bh
    mov var1+1, ah
    mov var2+1, bh
    
    ;--------------
    mov cx, 2h
    lea si, var1; lea: cargar cadena caracteres 
    lea di, var2
    
    ciclo:
        mov al,[si]; [contenido]
        mov bl,[di]
        xchg al, bl
        mov [si], al
        mov [di], bl
        inc si
        inc di
    loop ciclo
;
.exit