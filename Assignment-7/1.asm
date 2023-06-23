%include "io.mac"

segment .data
vector1 dd 1,2,3,-5,-1
len1 dd 5
vector2 dd 2,4,4,-9
len2 dd 4

space db " ",0
segment .bss
d1 dd ? ,?



segment .text
global _start


_start:
	sub esp,4
	mov eax,[len1]
	push eax
	mov eax,vector1
	push eax
	call SquaredNorm
	pop eax
	mov [d1],eax
	PutLInt eax
	nwln
	sub esp,4
	mov eax,[len2]
	push eax
	mov eax,vector2
	push eax
	call SquaredNorm
	pop eax
	mov [d1+4],eax
	PutLInt eax
	nwln
.EXIT
	
SquaredNorm:
  	mov eax,0
	mov ebx,[esp+4]
    	mov esi,0
    	mov edx,[esp+8]
ll: 	cmp esi,edx
    	je end1
    	mov ecx,[ebx+esi*4]
   	imul ecx,ecx
    	add eax,ecx
    	inc esi
    	jmp ll
end1:
	mov [esp+12],eax
  	ret 8
	
