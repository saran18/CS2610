segment .data
p dd -1
q dd 2
r dd -5
s dd 3
t dd 13
u dd -3
v dd -3
w dd 1
z dd 0
t1 dd 0
t2 dd 0
t3 dd 0 
 



segment .text
global _start
_start:
    mov eax, [p]
    mov ebx, [q]
    add eax, ebx
    mov [t1],eax
    mov eax, [r]
    mov ebx, [s]
    sub eax, ebx
    imul eax,[t1]
    mov [t2],eax
    mov eax, [t]
    mov ebx, [u]
    idiv ebx
    add eax,[t2]
    mov [t3],eax
    mov eax,[v]
    mov ebx,[w]
    imul eax,ebx
    mov ebx,[t3]
    sub ebx, eax
    mov [z],ebx
    mov eax,[z]
    hlt

   

     
