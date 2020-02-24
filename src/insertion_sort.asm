; Arguments:
; rdi - the array
; rsi - length of the array
section .text
global insertion_sort
insertion_sort:
    push    r12
    push    r13
    mov     r10, 1

inner_loop:
    cmp     r10, rsi
    jge     end_inner_loop
    mov     r11d, dword [rdi + r10 * 4]
    mov     r12, r10
    dec     r12

s_inner_loop:
    cmp     r12, 0
    jl      end_s_inner_loop
    cmp     dword [rdi + r12 * 4], r11d
    jle     end_s_inner_loop
    mov     r13d, dword [rdi + r12 * 4]
    mov     dword [rdi + r12 * 4 + 4], r13d
    dec     r12
    jmp     s_inner_loop

end_s_inner_loop:
    mov     dword [rdi + r12 * 4 + 4], r11d
    inc     r10
    jmp     inner_loop

end_inner_loop:
    pop     r13
    pop     r12
    ret