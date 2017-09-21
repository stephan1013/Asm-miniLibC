BITS 64
	section .text
	global	strncmp

strncmp:

	enter	0, 0

	xor     rcx, rcx
	sub	rdx, 1
	jmp	cmp_loop

cmp_loop:

	mov	r8b, [rsi]
	mov	r9b, [rdi]

	cmp     rcx, rdx
	je      sub

	cmp	r8b, 0
	je	sub

	cmp	r9b, 0
	je	sub

	cmp	r9b, r8b
	jne	sub

	add     rcx, 1
	add	rdi, 1
	add	rsi, 1

	jmp	cmp_loop

sub:
	sub	r9b, r8b
	movsx	rax, r9b

	leave

	ret
