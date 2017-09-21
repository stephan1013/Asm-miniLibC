BITS 64
	section .text
	global	strpbrk

strpbrk:
	enter	0, 0

	xor	rcx, rcx

	cmp	byte[rsi], 0
	je	end_null

	cmp	byte[rdi], 0
	je	end_null

	jmp 	myloop

myloop:
	cmp	byte[rdi], 0
	je	end_null

	mov	r8b, [rdi]
	jmp	find

find:
	cmp	byte[rsi], 0
	je	reset

	cmp	r8b, [rsi]
	je	end

	add	rsi, 1
	add	rcx, 1

	jmp	find

reset:
	cmp	rcx, 0
	je	next

	sub	rsi, 1
	sub	rcx, 1
	jmp	reset

next:
	add	rdi, 1
	jmp	myloop
end:
	mov	rax, rdi

	leave

	ret

end_null:
	mov	rax, 0

	leave

	ret
