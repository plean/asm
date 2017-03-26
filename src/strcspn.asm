        extern  _GLOBAL_OFFSET_TABLE_
	global strcspn:function

_strlen:
	mov     rax, -1		; set the return value at -1

_strlen_loop:
	inc     rax	; increment rax
	cmp     byte [rdi + rax], 0 ; test if rax element of rdi if not equal to 0
	jne     _strlen_loop		    ; if not loop
	ret			    ; else return rax

strcspn:
	;; call	_strlen		; rax = strlen(rdi);
	xor	rax, rax	; rax = 0;
        xor     r9, r9		; r9 = 0;
_loop:
	cmp     byte [rdi + r9], 0 ; if !rdi[r9]
	je      _ret		   ;   goto _ret;
	xor     r8, r8		   ; r8 = 0;
_loop2:
	cmp     byte [rsi + r8], 0 ; if !rsi[r8]
	je      _inc		   ;   goto _inc;
	mov     rdx, [rsi + r8]	   ; rdx = rsi[r8];
	cmp     [rdi + r9], dl	   ; if rdi[r9] == (char)rdx
	je      _ret		   ;   goto _ret;
	inc     r8		   ; r8++;
	jmp     _loop2		   ; goto _loop2;
_inc:
	inc	rax		; rax++;
	inc	r9		; r9++;
	jmp     _loop		; goto _loop;
_ret:
	ret	 ; return rax;
