segment .data
u dd 5
v dd 4
w dd  5
x dd 5
e dd -3
f dd -2
g dd 0


segment .code
global _start
_start: 
    mov eax,[u]
    mov ebx,[v]
    cmp eax,ebx
    jge else1
    mov eax,[w]
    mov ebx,[x]
    cmp eax,ebx
    jne else1
    mov eax,[e]
    mov ebx,[f]
    add eax,ebx
    mov [g],eax
    jmp end1
    else1:
    mov eax,[e]
    mov ebx,[f]
    sub eax,ebx
    mov [g],eax
    end1:
    mov eax,[g]
    hlt
