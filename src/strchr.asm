	extern  _GLOBAL_OFFSET_TABLE_
	global strchr:function
	global index:function

strchr:
index:
	xor	rax, rax	        ; rax = 0;
_loop:					; while (
	cmp	byte [rdi + rax], sil 	; rdi[rax] != sil
	je	_found		      	; &&
	cmp	byte [rdi + rax], 0	; rdi[rax])
	je	_ret		      	; {
	inc	rax		      	; rax++;
	jmp	_loop		      	; }
_found:
	add	rax, rdi		; rax += rdi;
	ret				; return rax;
_ret:
	xor	rax, rax		; rax = 0;
	ret				; return rax;
