segment .data
vector dd 1,2,3,-5,-1
len dd 5
sum dd 0

segment .text
global _start
_start:
    mov eax,0
    mov esi,0
ll: cmp esi,[len]
    je end1
    mov ecx,[vector+esi*4]
    imul ecx,ecx
    add eax,ecx
    inc esi
    jmp ll
end1:
    mov [sum],eax
    mov eax,[sum]
    hlt
