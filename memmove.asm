BITS 64
	section .text
	global	memmove

memmove:
	enter	0, 0

	xor	rcx, rcx
	mov	r8, rdi
	sub	r8, rsi

	cmp	r8, 0
	jg	set_left

	cmp	r8, 0
	jl	move_right

	cmp	r8, 0
	je	move_equal

set_left:
	cmp	rcx, rdx
	je	set_pos

	add	rsi, 1
	add	rdi, 1
	add	rcx, 1

	jmp	set_left

set_pos:
	sub	rdi, 1
	sub	rsi, 1

	jmp	move_left

move_left:

	cmp	rcx, 0
	je	add_pos

	mov	r9b, [rsi]
	mov	[rdi], r9b

	sub	rcx, 1
	sub	rsi, 1
	sub	rdi, 1

	jmp	move_left

add_pos:
	add	rdi, 1
	jmp	end

move_right:
	cmp	rcx, rdx
	je	reset

	mov	r9b, [rsi]
	mov	[rdi], r9b

	add	rsi, 1
	add	rdi, 1
	add	rcx, 1

	jmp	move_right

reset:
	cmp	rcx, 0
	je 	end

	sub	rdi, 1
	sub	rcx, 1

	jmp	reset

move_equal:
	mov	rdi, rsi

end:
	mov	rax, rdi

	leave

	ret
