; insertion sort in C language
;void selectionSort(int arr[], int n) {
;    int i, j, min_idx;
;    for (i = 0; i < n-1; i++) {
;        min_idx = i;
;        for (j = i+1; j < n; j++)
;        if (arr[j] < arr[min_idx])
;            min_idx = j;
;        swap(&arr[min_idx], &arr[i]);
;    }
;}

; Arguments
; ebp + 8 - an array of nums
; ebp + 12 - length of the array

section .data

arr         equ     8
len         equ     12
dec_len     equ     -24
min_idx     equ     -28

section .text
global selection_sort
selection_sort:
    push    ebp
    mov     ebp, esp
    push    eax
    push    ebx
    push    ecx
    push    edx
    push    esi

    sub     esp, 8

    ; dec_len = len - 1
    mov     eax, dword [ebp + len]
    dec     eax
    mov     dword [ebp + dec_len], eax

    ; eax = i (counter)
    mov     eax, 0
    ; esi = address of the array
    mov     esi, dword [ebp + arr]
inner_loop:
    cmp     eax, dword [ebp + dec_len]
    jge     end_inner_loop
    mov     dword [ebp + min_idx], eax

    ; ebx = j (counter)
    mov     ebx, eax
    inc     ebx

s_inner_loop:
    cmp     ebx, dword [ebp + len]
    jge     end_s_inner_loop
    mov     ecx, dword [esi + ebx * 4]
    mov     edx, dword [ebp + min_idx]
    cmp     ecx, dword [esi + edx * 4]
    jge     e
    mov     dword [ebp + min_idx], ebx
e:
    inc     ebx
    jmp     s_inner_loop

end_s_inner_loop:
    mov     ecx, dword [ebp + min_idx]
    mov     edx, dword [esi + ecx * 4]
    xchg    edx, dword [esi + eax * 4]
    mov     dword [esi + ecx * 4], edx
    inc     eax
    jmp     inner_loop

end_inner_loop:
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    pop     eax
    mov     esp, ebp
    pop     ebp
    ret