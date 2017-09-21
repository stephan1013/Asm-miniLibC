BITS 64
	section .text
	global  strcspn

strcspn:
	enter	0,0

	xor	rcx, rcx
	xor	rdx, rdx

	cmp	byte[rdi], 0
	je	end

	cmp	byte[rsi], 0
	je	lenstr

	jmp	count

count:
	cmp	byte[rdi], 0
	je	end

	mov	r8b, [rdi]
	jmp	compar

compar:
	cmp	byte[rsi], 0
	je	reset

	cmp	r8b, [rsi]
	je	end

	add	rdx, 1
	add	rsi, 1
	jmp	compar

reset:
	cmp	rdx, 0
	je	next

	sub	rsi, 1
	sub	rdx, 1
	jmp	reset

next:
	add 	rdi, 1
	add	rcx, 1
	jmp	count

lenstr:
	cmp     byte[rdi], 0
	je      end

	add	rcx, 1
	add	rdi, 1
	jmp	lenstr

end:
	mov	rax, rcx

	leave
	ret
