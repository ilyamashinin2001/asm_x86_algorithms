; ebp + 8 - the array
; ebp + 12 - length of the array
section .data
arr     equ     8
len     equ     12

p       equ     -16
r       equ     -20

section .text
global quick_sort
quick_sort:
    push    ebp
    mov     ebp, esp
    push    eax
    push    ebx
    push    esi

    mov     esi, dword [ebp + arr]  ; the array

    mov     ebx, dword [ebp + len]  ; index of the last element
    dec     ebx

    xor     eax, eax ; index of the first element

    call    quick_recursive

    pop     esi
    pop     ebx
    pop     eax
    mov     esp, ebp
    pop     ebp
    ret

global quick_recursive
quick_recursive:
    push    ebp
    mov     ebp, esp

    cmp     eax, ebx
    jge     post_if

    push    eax
    push    ebx
    call    partition
    pop     ebx
    pop     eax
    ; q = ecx - index of the pivot

    push    eax
    push    ebx
    mov     ebx, ecx
    dec     ebx
    call    quick_recursive
    pop     ebx
    pop     eax

    push    eax
    push    ebx
    mov     eax, ecx
    inc     eax
    call    quick_recursive
    pop     ebx
    pop     eax


post_if:
    mov     esp, ebp
    pop     ebp
    ret

global partition
partition:
    ; ebp + 12 - index of the first element
    ; ebp + 8 - index of the last element
    push    ebp
    mov     ebp, esp

    mov     eax, dword [ebp + 8]
    mov     ebx, dword [esi + eax * 4]  ; x = A[r]
    mov     ecx, dword [ebp + 12]
    dec     ecx                     ; i = p - 1

    mov     edx, dword [ebp + 12]   ; j = p
    mov     edi, dword [ebp + 8]
    dec     edi                     ; r - 1
inner_loop:
    cmp     edx, edi
    jg      end_inner_loop
    cmp     dword [esi + edx * 4], ebx
    jg      post_if2
    inc     ecx
    mov     eax, dword [esi + ecx * 4]
    xchg    eax, dword [esi + edx * 4]
    mov     dword [esi + ecx * 4], eax
post_if2:
    inc     edx
    jmp     inner_loop

end_inner_loop:
    inc     ecx
    mov     eax, dword [ebp + 8]

    mov     ebx, dword [esi + ecx * 4]
    xchg    ebx, dword [esi + eax * 4]
    mov     dword [esi + ecx * 4], ebx

    mov     esp, ebp
    pop     ebp
    ret