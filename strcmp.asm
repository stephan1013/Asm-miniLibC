BITS 64
	section	.text
	global	strcmp

strcmp:
	enter	0, 0

	jmp	cmp

cmp:
	mov	r8b, [rsi]
	mov	r9b, [rdi]

	cmp	r8b, 0
	je	sub

	cmp	r9b, 0
	je	sub

	cmp	r9b, r8b
	jne	sub

	add	rdi, 1
	add	rsi, 1

	jmp	cmp

sub:
	sub	r9b, r8b
	movsx	rax, r9b

	leave

	ret
