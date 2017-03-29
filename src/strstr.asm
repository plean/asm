        extern  _GLOBAL_OFFSET_TABLE_
	global strstr:function

strstr:
	xor	rax, rax		; rax = 0;
	mov	rcx, [rsi]		; rcx = *rsi;
_loop:
	cmp	byte [rdi + rax], cl 	; if rdi[rax] != (char)rcx
	je	_test_found		;   goto _test_found;
	cmp	byte [rdi + rax], 0	; if !rdi[rax]
	je	_ret			;   goto _ret;
	inc	rax			; rax++;
	jmp	_loop			; goto _loop;
_test_found:
	xor	r8, r8		  	; r8 = 0;
	mov	r9, rax			; r9 = ra;
_loop2:
	inc	r8			; r8++;
	inc	r9			; r9++;
	cmp	byte [rsi + r8], 0	; if !rsi[r8]
	je	_found			;    goto _found;
	mov	rdx, [rsi + r8]		; rdx = rsi[r9];
	cmp	byte [rdi + r9], dl 	; if rdi[r9] == (char)rdx
	je	_loop2			;   goto _loop2;
	inc	rax			; rax++;
	jmp	_loop			; goto _loop;
_found:
	add	rax, rdi		; rax += rdi;
	cmp	byte [rax], 0		; if (char)rax == 0
	je	_ret			;   goto _ret;
	ret				; return rax;
_ret:
	xor	rax, rax		; rax = 0;
	ret				; return rax;
