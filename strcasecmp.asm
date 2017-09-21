BITS 64
	section	.text
	global	strcasecmp

strcasecmp:
	enter	0, 0

	xor	rcx, rcx
	xor	rdx, rdx
	jmp	check_first

check_first:
	mov	r8b, [rsi]
	cmp	r8b, 65
	jge	check_maj_first

	jmp	check_second

check_maj_first:
	cmp	r8b, 90
	jle	convert_first

	jmp	check_second

convert_first:
	add	r8b, 32

	jmp	check_second

check_second:
	mov	r9b, [rdi]

	cmp	r9b, 65
	jge	check_maj_second

	jmp	compart

check_maj_second:
	cmp	r9b, 90
	jle	convert_second

	jmp	compart

convert_second:
	add     r9b, 32
	jmp     compart

compart:
	cmp	r8b, 0
	je	sub

	cmp	r9b, 0
	je	sub

	cmp	r9b, r8b
	jne	sub

	add	rdi, 1
	add	rsi, 1
	jmp	check_first

sub:
	sub	r9b, r8b
	movsx	rax, r9b

	leave

	ret
