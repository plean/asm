	extern  _GLOBAL_OFFSET_TABLE_
	global putnbr:function

_putc:
	push	rdi		; push rdi (argument 1) on top of the stack
	mov	rsi, rsp	; rsp is pointing on rdi (1st argument)
	mov     rax, 1		; system call 1 is write
	mov     rdi, 1		; file handle 1 is stdout
	mov     rdx, 1		; number of bytes to write
	syscall			; invoke operating system to do the write
	pop	rdi		; restore the stack
	ret

putnbr:
;;;  if (nb < 0)
	cmp     edi, 0	; compare di (first argument) and 0
	jnl     _initialize_rax ; if di below 0 jump to _initalize_rax
	;;  else
	push    rdi	; save di
	mov     edi, '-' ; put '-' on di
	call    _putc	 ; equivalent putc('-')
	pop     rdi	; restore di
	neg     edi	; change the sign of di
_initialize_rax:
	xor     rax, rax ; initialize the return value
;;;  while loop -> while (nb)
_while_nb:
	cmp     edi, 0	; compare di and 0
	je      _save_rax ; if di equal 0 jump to _save_rax
	inc     eax ; increment ax for each number print
	push    rax	; save ax for the next operation
;;;  divide rdi by 10 and get the rest
	mov     eax, edi ; move di in ax (dividende)
	mov     ebx, 10	; move 10 in bx (diviseur)
	xor     edx, edx ; avoiding floating point exeption <=> mov edx, 0
	div     ebx	; div bx by ax and store the result in ax and the rest in dx
;;;  print the unite of the number in parameter
	push    rax	; save the result of the division
	add     edx, 48	; 48 is 0 on the ascii table
;;;  restore the variable and loop
	pop     rdi	; move the result of the division in di
	pop     rax	; restore ax
	push    rdx	; push unite number on the stack
	jmp     _while_nb ; recall the loop
_save_rax:
	push    rax	; store nb of bytes red
_aff_number:
	cmp     eax, 0	; compare ax and 0
	je      _return	; if ax equal 0 goto return
	;;  else
	dec     eax	; decrement ax
	pop	r10	; stock nb of bytes red (final return value)
	pop     rdi	; get number to print
	push    r10	; push nb of bytes red (final return value)
	push    rax	; save ax
	call    _putc	;
	push	rdi
	pop     rax	; restore ax
	jmp     _aff_number ; loop
_return:
	pop     rax	; restore rax (final return value)
	ret	; return ax
