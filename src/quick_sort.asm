section .text
global quick_sort
quick_sort:
    mov     rdx, rsi
    dec     rdx
    xor     rsi, rsi
    call    quick_sort_recursion
    ret

global quick_sort_recursion
quick_sort_recursion:
    cmp     rsi, rdx
    jge     post

    call    partition
    push    rax
    push    rdx
    dec     rax
    mov     rdx, rax
    call    quick_sort_recursion

    pop     rdx
    pop     rax
    inc     rax
    mov     rsi, rax
    call    quick_sort_recursion
post:
    ret

global partition
partition:
    push    r12
    push    r13
    push    r14

    mov     r10d, dword [rdi + rdx * 4]
    mov     r11, rsi
    dec     r11
    mov     r12, rsi
    mov     r13, rdx
    dec     r13
inner_loop:
    cmp     r12, r13
    jg      post_inner_loop
    mov     r14d, dword [rdi + r12 * 4]
    cmp     r14, r10
    jg      post_if
    inc     r11
    ; A[i] with A[j]
    xchg    r14d, dword [rdi + r11 * 4]
    mov     dword [rdi + r12 * 4], r14d
post_if:
    inc     r12
    jmp     inner_loop
post_inner_loop:
    mov     r14d, dword [rdi + r11 * 4 + 4]
    xchg    r14d, dword [rdi + rdx * 4]
    mov     dword [rdi + r11 * 4 + 4], r14d
    mov     rax, r11
    inc     rax

    pop     r14
    pop     r13
    pop     r12
    ret