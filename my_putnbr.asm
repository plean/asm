	global my_putnbr

my_putnbr:
;;;  if (nb < 0)
	cmp     edi, 0	; compare di (first argument) and 0
	jnl     _initialize_rax ; if di below 0 jump to _while_nb
	;;  else
	push    rdi	; save di
	mov     edi, '-' ; put '-' on di
	call    my_putchar ; equivalent my_putchar('-')
	pop     rdi	; restore di
	neg     edi	; change the sign of di
_initialize_rax:
	xor     eax, eax ; initialize the return value
;;;  while loop -> while (nb)
_while_nb:
	cmp     edi, 0	; compare di and 0
	je      _aff_number ; if di equal 0 jump to _return
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
_aff_number:
	cmp     eax, 0	; compare ax and 0
	je      _return	; if ax equal 0 goto return
	;;  else
	dec     eax	; decrement ax
	pop     rdi	;
	push    rax	; save ax
	call    my_putchar ;
	pop     rax	; restore ax
	jmp     _aff_number ; loop
_return:
	        ret		; return ax
