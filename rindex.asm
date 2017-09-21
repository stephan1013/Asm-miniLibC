BITS 64
	section .text
	global	rindex

rindex:
	enter	0, 0

	xor	rcx, rcx
	cmp	byte[rdi], 0
	je	null_end

	jmp 	find_end

find_end:
	cmp	byte[rdi], 0
	je	myloop

	add	rcx, 1
	add     rdi, 1
	jmp	find_end

myloop:
	cmp	byte[rdi], sil
	je	end

	cmp 	rcx, 0
	je	null_end

	sub	rdi, 1
	sub	rcx, 1
	jmp	myloop

end:
	mov	rax, rdi

	leave

	ret

null_end:
	cmp	sil, 0
	je	end

	mov	rax, 0

	leave

	ret
