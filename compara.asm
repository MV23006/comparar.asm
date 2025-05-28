section .text
    global comparar_cadenas

; int comparar_cadenas(const char *cadena1, const char *cadena2)
comparar_cadenas:
    ; Argumentos:
    ; RDI = puntero a cadena1
    ; RSI = puntero a cadena2

.loop:
    mov al, [rdi]   ; cargar carácter de cadena1
    mov bl, [rsi]   ; cargar carácter de cadena2

    cmp al, 0       ; si carácter es NULL en cadena1, fin
    je .fin
    cmp bl, 0       ; si carácter es NULL en cadena2, fin
    je .fin

    cmp al, bl      ; comparar caracteres
    jne .diferente
    inc rdi         ; avanzar en cadena1
    inc rsi         ; avanzar en cadena2
    jmp .loop

.fin:
    ; Si llegamos aquí, hay que verificar si ambos terminan en NULL
    mov al, [rdi]
    mov bl, [rsi]
    cmp al, bl
    je .iguales
    jmp .diferente

.iguales:
    mov eax, 0      ; cadenas iguales
    ret

.diferente:
    mov eax, 1      ; cadenas diferentes
    ret
