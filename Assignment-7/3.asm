%include "io.mac"

segment .data
n1 dd 4
n2 dd 6
segment .bss
n_fact dd ?,?
segment .text  
global _start

_start:
    sub esp, 4
    mov eax, [n1]
    push eax
    call factorial
    pop eax
    mov [n_fact], eax
    PutLInt eax
    nwln
    sub esp, 4
    mov eax, [n2]
    push eax
    call factorial
    pop eax
    mov [n_fact+4], eax
    PutLInt eax
    nwln
.EXIT

factorial:
    sub esp, 12
    mov eax, [esp+16]
    mov [esp+8], eax
    mov ebx, 2
    cmp [esp+8], ebx
    je end1
    mov ecx, [esp+16]
    dec ecx
    sub esp, 4
    push ecx
    call factorial
    mov eax, [esp]
    mov ebx, [esp+20]
    imul eax, ebx
    mov [esp+24], eax
    add esp, 16
    ret 4

end1:
    mov [esp+20], ebx
    add esp, 12
    ret 4
