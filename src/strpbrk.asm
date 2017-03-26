        extern  _GLOBAL_OFFSET_TABLE_
	global strpbrk:function

strpbrk:	
	xor	rax, rax	; rax = 0;
_loop:
	cmp	byte [rdi + rax], 0 ; if !rdi[rax]
	je	_ret		    ;   goto _ret;
	xor	r8, r8		    ; r8 = 0;
_loop2:	
	cmp	byte [rsi + r8], 0 ; if !rsi[r8]
	je	_inc		   ;   goto _inc;
	mov	rdx, [rsi + r8]	   ; rdx = rsi[r8];
	cmp	[rdi + rax], dl	   ; if rdi[rax] == (char)rdx
	je	_found		   ;   goto _found;
	inc	r8		   ; r8++;
	jmp	_loop2		   ; goto _loop2;
_inc:	
	inc	rax		; rax++;
	jmp	_loop		; goto _loop;
_found:
	add	rax, rdi	; rax += rdi;
	ret			; return rax;
_ret:
	xor	rax, rax	; rax = 0;
	ret			; return rax
