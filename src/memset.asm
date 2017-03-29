        extern  _GLOBAL_OFFSET_TABLE_
	global memset:function

memset:				; void *memset(void *rdi, int rsi, size_t rdx);
	xor	rcx, rcx	; rcx = 0;
	mov	rax, rdi	; rax = rdi
_loop:
	cmp	rdx, rcx	; if (rdx == rcx)
	jz	_end		;   goto _end;
	mov	[rdi], sil	; *rax = (char)rsi;
	inc	rcx		; rcx++;
	inc	rdi		; rax++;
	jmp	_loop		; goto _loop;
_end:
	ret			; return rax;
