BITS 64
	section .text
	global	memcpy

memcpy:
	enter	0, 0

	xor	rcx, rcx
	mov	r8, rdi

	jmp	cpy
cpy:

	cmp	rcx, rdx
	je	end

	mov	r9b, [rsi]
	mov	[r8], r9b

	add	r8, 1
	add	rsi, 1
	add	rcx, 1

	jmp	cpy

end:
	mov	rax, rdi

	leave

	ret
