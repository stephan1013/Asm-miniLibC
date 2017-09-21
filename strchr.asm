BITS 64
	section .text
	global	strchr

strchr:
	enter	0, 0

	jmp 	myloop

myloop:

	cmp	byte[rdi], sil
	je	end

	cmp	byte[rdi], 0
	je	end2

	add	rdi, 1

	jmp	myloop

end:
	mov	rax, rdi

	leave

	ret

end2:
	mov	rax, 0

	leave

	ret
