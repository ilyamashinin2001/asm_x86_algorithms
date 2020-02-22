; Insertion sort in C language:
; void insertionSort(int arr[], int n)  {
;   int i, key, j;
;   for (i = 1; i < n; i++) {
;       key = arr[i];
;       j = i - 1;
;       while (j >= 0 && arr[j] > key) {
;           arr[j + 1] = arr[j];
;           j = j - 1;
;       }
;       arr[j + 1] = key;
;   }
;}

; Arguments:
; ebp + 8 - an array of nums
; ebp + 12 - length of the array

section .data

arr     equ     8
len     equ     12
key     equ     -16

section .text
global insertion_sort
insertion_sort:
    push    ebp
    mov     ebp, esp
    push    eax
    push    ebx
    push    edi

    sub     esp, 4

    mov     eax, 1
    mov     edi, dword [ebp + arr]
inner_loop:
    cmp     eax, dword [ebp + len]
    jge     end_inner_loop

    mov     ebx, dword [edi + eax * 4]
    mov     dword [ebp + key], ebx
    mov     ebx, eax
    dec     ebx

s_inner_loop:
    cmp     ebx, 0
    jl      end_s_inner_loop
    mov     edx, dword [ebp + key]
    cmp     dword [edi + ebx * 4], edx
    jle     end_s_inner_loop

    mov     edx, dword [edi + ebx * 4]
    mov     dword [edi + ebx * 4 + 4], edx
    dec     ebx
    jmp     s_inner_loop

end_s_inner_loop:
    mov     edx, dword [ebp + key]
    mov     dword [edi + ebx * 4 + 4], edx
    inc     eax
    jmp     inner_loop

end_inner_loop:
    pop     edi
    pop     ebx
    pop     eax
    mov     esp, ebp
    pop     ebp
    ret