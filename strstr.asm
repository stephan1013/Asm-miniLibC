BITS 64
	section	.text
	global	strstr

strstr:
	enter	0, 0

	xor	rcx, rcx

	jmp	comp

comp:
	mov	r8b, byte[rsi + rcx]
	mov	r9b, byte[rdi + rcx]

	cmp	r8b, 0
	je	end

	cmp	r9b, r8b
	jne	check

	inc	rcx

	jmp	comp


check:
	cmp	r9b, 0
	je	end_null

	add	rdi, 1
	xor	rcx, rcx

	jmp	comp

end_null:
	mov	rax, 0

	leave

	ret

end:
	mov     rax, rdi

	leave

	ret
