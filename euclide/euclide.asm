SEGMENT .text
global _start

euclide:
	xor rdx,rdx
	.division:
		div rbx
		mov rax,rbx
		mov rbx,rdx
		xor rdx,rdx
		cmp rbx,0
	jnz .division
ret

convert:
	mov rcx,0
	mov rbx,10
	.divide:
		xor rdx,rdx
		div rbx
		add rdx,48
		push rdx
		inc rcx
		cmp rax,0
	jnz .divide

	.reverse:
		pop rax
		mov [rdi],rax
		inc rdi
		dec rcx
		cmp rcx,0
	jnz .reverse
		mov byte [rdi],0
		inc rdi
		mov byte [rdi],0xa
		
ret
		
_start:
	mov rax,232
	mov rbx,46
	call euclide

	mov rdi,buff
	call convert

	mov rax,4
	mov rbx,1
	mov rcx,buff
	mov rdx,5
	int 0x80
	
	mov rax,1
	mov rbx,0
	int 0x80 

SEGMENT .data
buff: db 0x00
