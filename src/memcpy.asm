        extern  _GLOBAL_OFFSET_TABLE_
	global memcpy:function

memcpy:				; void *memcpy(void *rdi, const void *rsi, size_t rdx);
	xor rcx, rcx		; rcx = 0;
_loop:
	cmp rdx, rcx 		; if (rdx == rcx)
	jz _end			;   goto _end;
	mov r8b, [rsi + rcx]	; 
	mov [rdi + rcx], r8b	; &rdi[rcx] = &rsi[rcx];
	inc rcx			; rcx++;
	jmp _loop		; goto _loop;
_end:
	mov rax, rdi		; rax = rdi;
	ret			; return rax;
