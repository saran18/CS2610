%include "io.mac" 

segment .data
X1 	dd -1, 2, -3
	dd 4, -5, 6
	
Y1	dd 2, 3, 4, -5
	dd 6, -1, 2, 5
	dd -1, 0, 2, 3

Z1 	dd 0, 0, 0, 0
	dd 0, 0, 0, 0
	
X2 	dd -1, -2, -3
	dd -4, 5, -6
	
Y2	dd 2, -3, -4, -5
	dd 6, 1, -2, 5
	dd 1, 0, 2, 3

Z2 	dd 0, 0, 0, 0
	dd 0, 0, 0, 0

space db " ",0
segment .text
global _start
MatrixMultiply:
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
	mov ebp,[esp+12]    ; ebp is not used in our code so we are using ebp as if it is a general purpose register , if not we will use the stack to store the temporary variables
	mov eax, [ebp + ebx]
	
	mov ebx, esi
	imul ebx, 16
	mov edi, edx
	imul edi, 4
	add ebx, edi
	mov ebp,[esp+8]
	imul eax, [ebp + ebx]
	
	mov ebx, ecx
	imul ebx, 16
	mov edi, edx
	imul edi, 4
	add ebx, edi
	
	mov ebp,[esp+4]
	mov edi, [ebp + ebx]
	add edi, eax
	mov [ebp + ebx], edi
	
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
	ret 12
_start:
	mov eax,X1;
	push eax
	mov eax,Y1
	push eax
	mov eax,Z1
	push eax
	call MatrixMultiply
	PutLInt [Z1]
	PutStr space
	PutLInt [Z1 + 4]
	PutStr space
	PutLInt [Z1 + 8]
	PutStr space
	PutLInt [Z1 + 12]
	nwln
	PutLInt [Z1 + 16]
	PutStr space
	PutLInt [Z1 + 20]
	PutStr space
	PutLInt [Z1 + 24]
	PutStr space
	PutLInt [Z1 + 28]
	nwln
	mov eax,X2;
	push eax
	mov eax,Y2
	push eax
	mov eax,Z2
	push eax
	call MatrixMultiply
	PutLInt [Z2]
	PutStr space
	PutLInt [Z2 + 4]
	PutStr space
	PutLInt [Z2 + 8]
	PutStr space
	PutLInt [Z2 + 12]
	nwln
	PutLInt [Z2 + 16]
	PutStr space
	PutLInt [Z2 + 20]
	PutStr space
	PutLInt [Z2 + 24]
	PutStr space
	PutLInt [Z2 + 28]
	nwln
.EXIT
	
