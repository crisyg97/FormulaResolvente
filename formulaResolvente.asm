;%include "io.inc"
extern printf

section .data
    raiz1 db "raiz1 = %f", 10,0
    raiz2 db "raiz2 = %f", 10,0
    a dq 0.0
    b dq 0.0
    c dq 0.0
    cuatro db 4
    cuatroxAC dq 0.0
    raiz dq 0.0
    dosxA dq 0.0
    result1 dq 0.0
    result2 dq 0.0
    
section .text

global formulaResolvente
formulaResolvente:
    mov ebp, esp; for correct debugging
    push ebp ;enter
    mov ebp,esp
    ;carga de parametros
    fld qword[ebp +8] ;st2
    fst qword[a] 

    fld qword[ebp +12] ;st1
    fst qword[b] 

    fld qword[ebp +16] ;st0
    fst qword[c] 
    
    fld qword[a]
    fadd qword[a]
    fstp qword[dosxA] ; 2*a
    
    fld qword[c] ; st0
    fmul qword[a] ; st0 := st0(c) * a
    fimul dword[cuatro] ;4 * st0
    fstp qword[cuatroxAC]
   
    fld qword[b] ; st0
    fmul st0, st0 ; st0 := st0 * st0
    
    fld qword[cuatroxAC]
    fsub  ; st0 := st1 - st0

    fsqrt  ; raiz(st0)
    fst qword[raiz]
    
    fld qword[b] 
    fchs ;cambia el signo de b
    
    fadd  ; st0 := -b + raiz() 
    fdiv qword[dosxA] ; st0 := (-b + raiz())/ 2*a
    fst qword[result1] 
    ;imprimir result1
    push dword[result1 +4]
    push dword[result1]
    push raiz1
    call printf
    
    fld qword[b]
    fchs 
    fsub qword[raiz]
    fdiv qword[dosxA]
    fst qword[result2] 
    ;imprimir result2
    push dword[result2 +4]
    push dword[result2]
    push raiz2
    call printf
    
    add esp, 16
    
    mov esp,ebp ;leave
    pop ebp	
    ret