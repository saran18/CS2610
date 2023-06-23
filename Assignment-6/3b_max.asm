%include "io.mac" 

segment .data
mat 	dd 9, 3, 5, 6, 12
	dd 6, 44, 53, 12, 11
	dd 32, 12, 10, 33, 6
	dd 45, 34, 23, 54, 12
	dd 87, 32, 12, 11, 0


segment .text
global _start
_start:
	mov esi, 0; column number
		
column:	cmp esi, 5
	je end1	
	mov ecx, 1 ; the row number
	mov eax, [mat + esi*4]
	
row:		
	mov edx, ecx
	imul edx, 20
	mov ebx, esi
	imul ebx, 4
	add edx, ebx
	mov ebx, [mat + edx]
	cmp ebx, eax
	jge max

ret_row:
	inc ecx
	cmp ecx, 5
	je col_inc
	jmp row
	
max:	mov eax, ebx
	jmp ret_row
	
col_inc:
	PutLInt eax
	nwln
	inc esi
	jmp column	

end1:	
.EXIT
