	extern  _GLOBAL_OFFSET_TABLE_
	global strncmp:function


strncmp:			; strncmp(char *s1, char *s2, size_t n)
	;; int i, ret;
	xor	r8, r8		; i ^= i <=> i = 0
	xor	rax, rax	; ret ^= ret <=> ret = 0
_loop:
	cmp	r8, rdx		   ; if i == n
	je	_return_zero	   ; goto _return_zero
	mov	byte al, [rdi + r8]; (char)ret = s1[i]
	cmp	byte al, [rsi + r8]; if (char)ret != 0
	jne	_upd_val	   ; goto _upd_val
	cmp	byte [rdi + r8], 0 ; if s1[i] == 0
	je	_upd_val	   ; goto _upd_val
	inc	r8		   ; i++
	jmp	_loop
_upd_val:
	sub	al, [rsi + r8]	; (char)ret -= s2[i]
	cmp	al, 127		; if (char)al <= 127
	jbe	_return		; goto _return
	sub	eax, 256	; ret -= 256
	ret
_return_zero:	
	xor	rax, rax
_return:
	ret			; return ret
