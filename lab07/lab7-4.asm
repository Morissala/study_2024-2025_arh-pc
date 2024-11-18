%include 'in_out.asm'

section .data
    msg_x db 'Введите x: ', 0
    msg_a db 'Введите a: ', 0
    msg_result db 'Результат f(x): ', 0

section .bss
    x resd 1
    a resd 1

section .text
global _start

_start:
    ; Ввод x
    mov eax, msg_x
    call sprint
    mov eax, x
    mov edx, 10
    call sread
    call atoi
    mov [x], eax

    ; Ввод a
    mov eax, msg_a
    call sprint
    mov eax, a
    mov edx, 10
    call sread
    call atoi
    mov [a], eax

 ; Вычисление f(x)
 mov eax,[x]
 cmp eax,3 
 je calculate_case1 

 calculate_case2:
  mov eax,[a]
  add eax,1 
  jmp print_result 

 calculate_case1:
  imul eax,3 

print_result:
  mov edx,eax 
  mov eax,msg_result 
  call sprint 
  call iprintLF 

 call quit 

