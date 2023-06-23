%include "io.mac"

segment .data
mat 	dd 9, 3, 5, 6, 12
	dd 6, 44, 53, 12, 11
	dd 32, 12, 10, 33, 6
	dd 57, 34, 23, 54, 12
	dd 87, 32, 12, 11, 0


segment .text
global _start
_start:
	mov ecx,0 ; the row number
	mov eax, [mat]
	
row:	cmp ecx, 5
	je end1	
	mov esi, 0; column number in the row
	
column:		
	mov edx, ecx
	imul edx, 20
	mov ebx, esi
	imul ebx, 4
	add edx, ebx	
	mov ebx, [mat + edx]
	cmp ebx, eax
	jge max
	
ret_col:
	inc esi
	cmp esi, 5
	je row_inc
	jmp column
	
max:	
	mov eax, ebx
	jmp ret_col
	
row_inc:
	inc ecx
	jmp row

end1:
	PutLInt eax
	nwln
.EXIT
	
