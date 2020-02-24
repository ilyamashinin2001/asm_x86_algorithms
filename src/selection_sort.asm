; rdi - the array
; rsi - number of the array

section .text
global selection_sort
selection_sort:
    push    r12
    push    r13
    push    r14

    mov     r10, 0
    mov     r11, rsi
    dec     r11
inner_loop:
    cmp     r10, r11
    jge     end_inner_loop
    mov     r12, r10

    mov     r13, r10
    inc     r13
s_inner_loop:
    cmp     r13, rsi
    jge     end_s_inner_loop

    mov     r14d, dword [rdi + r13 * 4]
    cmp     r14d, dword [rdi + r12 * 4]
    jge     post_if

    mov     r12, r13
post_if:
    inc     r13
    jmp     s_inner_loop

end_s_inner_loop:
    mov     r14d, dword [rdi + r12 * 4]
    xchg    r14d, dword [rdi + r10 * 4]
    mov     dword [rdi + r12 * 4], r14d

    inc     r10
    jmp     inner_loop


end_inner_loop:
    pop     r14
    pop     r13
    pop     r12
    ret