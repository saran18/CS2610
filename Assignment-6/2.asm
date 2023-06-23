%include "io.mac"
segment .data
student dq "CS21B001"
	dd 1, 2, 3
	dq "CS21B060"
	dd 4, 5, 6
	dq "CS21B011"
	dd 7, 8, 9
	dq "CS21B072"
	dd 11, 12, 13
	dq "CS21B069"
	dd 14, 15, 16

segment .text
global _start
_start:
	mov esi, student
	mov eax, [esi+8]
	mov ebx, [esi+28]
	add eax, ebx
	mov ebx, [esi+48]
	add eax, ebx
	mov ebx, [esi+68]
	add eax, ebx
	mov ebx, [esi+88]
	add eax, ebx	
	mov ebx, 5
	div ebx
	PutLInt eax   
	nwln
.EXIT                
