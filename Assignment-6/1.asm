%include "io.mac"

segment .data
student dq "CS21B060"
	dd 5, 4, 13

segment .text
global _start
_start:
	mov esi, student
	mov eax, [esi+8]	
	mov ebx, [esi+12]
	add eax, ebx
	mov ebx, [esi+16]
	add eax, ebx
	mov ebx,3
	div ebx
	PutLInt eax
	nwln
.EXIT
