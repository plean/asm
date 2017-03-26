	extern  _GLOBAL_OFFSET_TABLE_
	global strcasecmp:function

strcasecmp:			; int strcasecmp(char *rdi, char *rsi);
	xor	r8, r8		; r8 = 0;
	xor	rax, rax	; rax = 0;
_loop:
	mov	al, [rdi + r8]	   ; (char)rax = rdi[r8];
	cmp	al, 65		   ; if ((char)rax < 'A')
	jl	_opt1		   ;   goto _opt1;
	cmp	al, 90		   ; if ((char)rax > 'Z')
	jg	_opt1		   ;   goto _opt1;
	add	al, 32		   ; al += 32;
_opt1:	
	mov	cl, [rsi + r8]	   ; (char)rcx = rsi[r8];
	cmp	cl, 65		   ; if ((char)rcx < 'A')
	jl	_opt2		   ;   goto _opt2;
	cmp	cl, 90		   ; if ((char)rcx > 'Z')
	jg	_opt2		   ;   goto _opt2;
	add	cl, 32		   ; al += 32;
_opt2:	
	cmp	al, cl		   ; if (rdi[r8] != rsi[r8])
	jne	_upd_val	   ; 	goto _upd_val;
	cmp	byte [rdi + r8], 0 ; if (rdi[r8] == 0)
	je	_upd_val	   ; 	goto _upd_val
	inc	r8		   ; r8++
	jmp	_loop		   ; goto _loop
_upd_val:
	sub	al, cl		; (char)rax -= (char)rcx;
	cmp	al, 127		; if (char)rax <= 127
	jbe	_return		;   goto _return
	sub	eax, 256	; (int)rax -= 256
_return:
	ret			; return ret
