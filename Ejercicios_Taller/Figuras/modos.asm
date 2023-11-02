.stack 64
.data

cant_rep db 28h
caracter db 00h
color db 00h
copia_cl db 00h

.code
.startup
    mov ax, 0000h               ; modo texto 40x25
    int 10h

    mov ch, 20h                 ; ocultar cursor
    mov ah, 01h
    int 10h
    call pausar

    mov ch, 06h                 ; mostrar cursor de una linea
    mov cl, 07h
    mov ah, 01h
    int 10h
    call pausar

    mov ch, 00h                 ; mostrar cursor cuadrado
	mov cl, 07h
	mov ah, 01h
	int 10h
	call pausar
           
    mov al, 30h                 ; imprimir '0'
    mov bx, 0001h               ; pagina 0, colores
    mov ch, 00h
	mov cl, [cant_rep]          ; repetir 25 veces
	call imprimir
	call pausar

    mov cx, 0009h
    copiar:
        mov [copia_cl], cl
        mov bh, 00h             ; pagina 0
        mov ah, 08h
        int 10h                 ; obtener caracter en fila
        inc al
        mov [caracter], al      ; almacenar en variables
        mov [color], ah
        call sigfila            ; mover a fila siguiente
        mov al, [caracter]      ; usar variables
        mov bh, 00              ; pagina
        mov bl, [color]         ; color
        inc bl
        mov ch, 00h
    	mov cl, [cant_rep]      ; repetir 25 veces
    	call imprimir
        call pausar
        mov cl, [copia_cl]
        loop copiar

    mov dx, 1800h               ; cursor en posicion (24, 0)
    mov bh, 00h
    mov ah, 02h
    int 10h

    mov al, 41h
    mov cx, 0050h               ; imprimir 80 veces
    teletype:
        mov ah, 0eh
        int 10h
        loop teletype

    call pausar
    mov al, 01h
    mov ah, 05h
    int 10h
    call pausar
    mov al, 00h
    mov ah, 05h
    int 10h
    call pausar
.exit

pausar proc near
    mov ax, 0c07h
    int 21h
    ret
pausar endp

imprimir proc near
	mov ah, 09h
	int 10h
	ret
imprimir endp

sigfila proc near
    mov bh, 00h                 ; obtener posicion de cursor en dx
	mov ah, 03h
	int 10h
	mov bh, 00h                 ; pagina 0
	inc dh                      ; desplazarse una fila
	mov ah, 02h
	int 10h
	ret
sigfila endp
