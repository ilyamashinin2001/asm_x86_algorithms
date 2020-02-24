section .data

arr     dd      2, 8, 7, 1, 3, 5, 6, 4
arr2    dd      -2, 4, 2, 7, 3, 1, 2, 9

extern insertion_sort
extern selection_sort
;extern quick_sort

section .text
global _start
_start:
    mov     ebp, esp

    mov     rdi, arr
    mov     rsi, 8
    call    selection_sort

    mov     rdi, arr2
    mov     rsi, 8
    call    insertion_sort
last:
    mov     eax, 60
    mov     edi, 0