BITS 64
	section .text
	global	memset
memset:
	enter	0, 0

	xor	rcx, rcx
	mov	r9, rdi

	jmp	set
set:
	cmp	rcx, rdx
	je	end

	mov	[r9], sil
	add	rcx, 1
	add	r9, 1

	jmp	set
end:
	mov	rax, rdi

	leave

	ret
