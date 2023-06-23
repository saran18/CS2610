%include "io.mac" 

segment .data
X 	dd -1, 2, -3
	dd 4, -5, 6
	
Y	dd 2, 3, 4, -5
	dd 6, -1, 2, 5
	dd -1, 0, 2, 3

Z 	dd 0, 0, 0, 0
	dd 0, 0, 0, 0
space db " ",0

segment .text
global _start
_start:
	mov ecx, 0 ; the X iterator
	mov edx, 0 ; the Y iterator
	
row:
	mov esi, 0; index 
	
column:
	mov ebx, ecx
	imul ebx, 12
	mov edi, esi
	imul edi, 4
	add ebx, edi
	mov eax, [X + ebx]
	
	mov ebx, esi
	imul ebx, 16
	mov edi, edx
	imul edi, 4
	add ebx, edi
	imul eax, [Y + ebx]
	
	mov ebx, ecx
	imul ebx, 16
	mov edi, edx
	imul edi, 4
	add ebx, edi
	
	mov edi, [Z + ebx]
	add edi, eax
	mov [Z + ebx], edi
	
	inc esi
	cmp esi, 3
	je next_col
	jmp column
	
next_col:
	inc edx
	cmp edx, 4
	je next_row
	jmp row

next_row:
	mov edx, 0
	inc ecx
	cmp ecx, 2
	je end1
	jmp row

end1:
	PutLInt [Z]
	PutStr space
	PutLInt [Z + 4]
	PutStr space
	PutLInt [Z + 8]
	PutStr space
	PutLInt [Z + 12]
	nwln
	PutLInt [Z + 16]
	PutStr space
	PutLInt [Z + 20]
	PutStr space
	PutLInt [Z + 24]
	PutStr space
	PutLInt [Z + 28]
	nwln
.EXIT
	
