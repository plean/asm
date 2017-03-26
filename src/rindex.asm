	extern  _GLOBAL_OFFSET_TABLE_
	global	rindex:function
	global	strrchr:function

_strlen:
	mov     rax, -1		; set the return value at -1

_strlen_loop:
	inc     rax	; increment rax
	cmp     byte [rdi + rax], 0 ; test if rax element of rdi if not equal to 0
	jne     _strlen_loop	    ; if not loop
	ret			    ; else return rax
	

rindex:
strrchr:	
	call	_strlen		; rax = strlen(rdi);
_loop:				; while (
	cmp	byte [rdi + rax], sil ; r8[rax] != sil
	je	_found		; &&
	cmp	rax, 0		; rax)
	je	_ret		; {
	dec	rax		; rax--;
	jmp	_loop		; }
_found:	
	add	rax, rdi	; rax += rdi;
_ret:
	ret			; return rax
