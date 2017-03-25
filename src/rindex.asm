	extern  _GLOBAL_OFFSET_TABLE_
	global	rindex:function

_strlen:
	mov     rax, -1		; set the return value at -1

_strlen_loop:
	inc     rax	; increment rax
	cmp     byte [rdi + rax], 0 ; test if rax element of rdi if not equal to 0
	jne     _strlen_loop	    ; if not loop
	ret			    ; else return rax
	

rindex:
	push	rdi		;
	push	rsi		;
	call	_strlen		; rax = strlen(rdi);
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
