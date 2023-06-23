segment .data
char db 37 
x dd 6
y dd 4 
z dd 0
r dd -1

segment .text
global _start
_start: 
    mov al,[char]
    mov bl,43
    cmp al,bl
    jne two
    mov eax,[x]
    mov ebx,[y]
    add eax,ebx
    mov [z],eax
    jmp end1
    two:
    mov bl,45
    cmp al,bl
    jne three
    mov eax,[x]
    mov ebx,[y]
    sub eax,ebx
    mov [z],eax
    jmp end1
    three:
    mov bl,42
    cmp al,bl
    jne four
    mov eax,[x]
    mov ebx,[y]
    imul eax,ebx
    mov [z],eax
    jmp end1
    four:
    mov bl,47
    cmp al,bl
    jne five
    mov eax,[x]
    mov ebx,[y]
    idiv ebx
    mov [r],edx
    mov [z],eax
    jmp end1
    five:
    mov bl,37
    cmp al,bl
    jne six
    mov eax,[x]
    mov ebx,[y]
    idiv ebx
    mov [z],edx
    jmp end1
    six:
    mov eax,0
    mov [z],eax
    end1:
    mov eax,[z]
    mov ebx,[r]
    hlt

