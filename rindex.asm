	extern	my_strlen
	global	my_rindex

my_rindex:
	push	rdi		;
	push	rsi		;
	call	my_strlen	; rax = strlen(rdi);
	pop	rsi		;
	pop	rdi		;
_loop:				; while (rax && r8[rax] != sil)
	cmp	byte [rdi + rax], sil ;
	je	_ret		;
	cmp	rax, 0		;
	je	_not_found	; {
	dec	rax		; rax--;
	jmp	_loop		; }
_ret:	
	add	rax, rdi	; rax += rdi;
	ret			; return rax;
_not_found:
	xor	rax, rax	; rax = NULL
	ret			; return rax
