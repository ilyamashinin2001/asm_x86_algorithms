section .text
global bubble_sort
bubble_sort:
    push    r12
    push    r13
    push    r14
    xor     r10, r10
    mov     r12, rsi
    dec     r12
inner_loop:
    cmp     r10, r12
    jge     end_inner_loop
    mov     r13, r12
    sub     r13, r10
    xor     r11, r11
s_inner_loop:
    cmp     r11, r13
    jge     end_s_inner_loop

    mov     r14d, dword [rdi + r11 * 4]
    cmp     r14d, dword [rdi + (r11 + 1) * 4]
    jle     post_if

    xchg    r14d, dword [rdi + (r11 + 1) * 4]
    mov     dword [rdi + r11 * 4], r14d

post_if:
    inc     r11
    jmp     s_inner_loop
end_s_inner_loop:
    inc     r10
    jmp     inner_loop

end_inner_loop:
    pop     r14
    pop     r13
    pop     r12
    ret