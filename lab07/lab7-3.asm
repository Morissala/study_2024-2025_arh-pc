%include 'in_out.asm'

section .data
msg1 db 'Введите B: ',0h
msg2 db "Наименьшее число: ",0h
A dd 94
C dd 58

section .bss
min resb 10
B resb 10

section .text
global _start
_start:

; ---------- Вывод сообщения 'Введите B: '
mov eax,msg1
call sprint

; ---------- Ввод 'B'
mov ecx,B
mov edx,10
call sread

; ---------- Преобразование 'B' из символа в число
mov eax,B
call atoi ; Вызов подпрограммы перевода символа в число
mov [B],eax ; запись преобразованного числа в 'B'

; ---------- Записываем 'A' в переменную 'min'
mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'

; ---------- Сравниваем 'A' и 'C'
cmp ecx,[C] ; Сравниваем 'A' и 'C'
jl check_B ; si 'A < C', alors on va à 'check_B'
mov ecx,[C] ; sinon 'ecx = C'
mov [min],ecx ; 'min = C'

; ---------- Сравниваем 'min(A,C)' и 'B'
check_B:
mov eax,[min]
cmp eax,[B] ; Сравниваем 'min(A,C)' и 'B'
jl fin ; si 'min(A,C) < B', alors on va à 'fin'
mov eax,[B] ; иначе 'eax = B'
mov [min],eax

; ---------- Вывод результата
fin:
mov eax, msg2
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход

