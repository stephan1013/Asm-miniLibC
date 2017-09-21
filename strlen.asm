BITS 64
	section .text
	global  strlen

strlen:
	enter	0, 0

	xor	rcx, rcx

	jmp	count

count:
	cmp     byte[rdi], 0
	je      end

	add	rcx, 1
	add	rdi, 1

	jmp	count

end:
	mov	rax, rcx

	leave

	ret
