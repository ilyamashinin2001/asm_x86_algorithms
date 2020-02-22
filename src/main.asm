section .data

arr     dd      99, 15, 204, 185, 564, 0, -200, -123, -1

extern insertion_sort

section .text
global _start
_start:
    mov     ebp, esp

    push    9
    push    arr
    call    insertion_sort
    mov     eax, 4

last:
    mov     eax, 60
    mov     edi, 0