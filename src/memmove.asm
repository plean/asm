        extern  _GLOBAL_OFFSET_TABLE_
	global memmove:function

_move:

memmove:			; void *memmove(void *rdi, void const *rsi, size_t rdx)
	mov rax, rdi		; rax = rdi;
	mov r8, rdi		; r8 = rdi;
	sub r8, rsi		; r8 -= rsi;
	cmp r8, 0		; if (r8 >= 0)
	jge _right		;   goto _right

_left:	
	xor rcx, rcx		; rcx = 0;
_loop_left:
	cmp rcx, rdx		; if (rcx == rdx)
	je _end			;   goto _end;
	mov r8b, [rsi + rcx]	; &rdi[rcx] =  &rsi[rcx];
	mov [rdi + rcx], r8b	;
	inc rcx			; rcx++
	jmp _loop_left		; goto _loop_left

_right:
	mov rcx, rdx		; rcx = rdx;
	dec rcx			; rcx--;
_loop_right:
	cmp rcx, 0		; if (rcx < 0)
	jl _end			;   goto _end;
	mov r8b, [rsi + rcx]	; &rdi[rcx] =  &rsi[rcx];
	mov [rdi + rcx], r8b	;
	dec rcx			; rcx--;
	jmp _loop_right		; goto _loop_right;
_end:
	ret			; return rax;
