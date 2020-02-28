section .data

arr     dd      2, 8, 7, 1, 3, 5, 6, 4
arr2    dd      -2, 4, 2, 7, 3, 1, 2, 9
arr3    dd      2, 8, 7, 1, 3, 5, 6, 4
arr4    dd      9, 8, 7, 6, 5, 4, 3, 2

extern insertion_sort
extern selection_sort
extern quick_sort
extern bubble_sort

section .text
global main
main:
    mov     ebp, esp

    mov     rdi, arr
    mov     rsi, 8
    call    selection_sort

    mov     rdi, arr2
    mov     rsi, 8
    call    insertion_sort

    mov     rdi, arr3
    mov     rsi, 8
    call    quick_sort

    mov     rdi, arr4
    mov     rsi, 8
    call    bubble_sort

    mov     eax, 60
    mov     edi, 0
    syscall