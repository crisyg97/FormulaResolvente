%include "io.inc"
extern _printf

section .data

vect dq 25.0,8.0,1.0,3.0
result dq 0.0
formato db "el numero es : %f", 10,13,0
n dq 2
vectorSize dq 4


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push eax
    push ecx
    
    mov eax, vect  ;eax apunta al vector
    xor ecx, ecx 
    
    call producto_rvf
    add esp, 12
    xor eax, eax
    ret
    
    producto_rvf:
        push ebp
        mov ebp, esp;enter
        
        fld qword[eax] ;carga en la pila un elemento del vector
        add eax, 8 ;sumo 8 bytes para apuntar al siguiente valor del vector
        inc ecx
        fimul dword[n] ; multiplico vect[i] * 2
        fst qword[result] ; guardo en result
        ;imprimo el resultado de un elemento del vector
        ;push dword[result+4]
        ;push dword[result]
        ;push formato
        ;call printf
        ;add esp, 12
        
        cmp ecx, [vectorSize] ;compara si son iguales, modificando el flag z (1 o 0)
        jnz producto_rvf ;si el flag z no es 0 salta a...
        
        mov esp, ebp;leave
        ;leave
        ret
