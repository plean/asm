	SECTION .data			; data section
msg:		db "Hello World", 10	; the string to print, 10=cr
len:		equ $-msg		; "$" means "here"
	;;  len is a value, not an address
char:		db 'a'

	SECTION .text		; code section
	global my_putnbr	; make label available to linker

helloworld:
	;;  write(1, message, len);
	mov     rax, 1		; system call 1 is write
	mov     rdi, 1		; file handle 1 is stdout
	mov     rsi, msg	; address of string to output
	mov     rdx, len	; number of bytes
        syscall			; invoke operating system to do the write

	ret

exit:
	mov rax, 60		; system call 60 is exit
	xor rdi, rdi		; exit code 0 <=> mov	rdi, 0
	syscall			; invoke operating system to exit




my_putchar:
	push	rdi		; push rdi (argument 1) on top of the stack
	mov	rsi, rsp	; rsp is pointing on rdi (1st argument)
	mov     rax, 1		; system call 1 is write
	mov     rdi, 1		; file handle 1 is stdout
	mov     rdx, 1		; number of bytes
	syscall			; invoke operating system to do the write
	pop	rdi		; restore the stack
	ret
	

my_strlen:
	mov	rax, -1		; set the return value at -1

loop:
	inc	rax		; increment rax
	cmp	byte [rdi + rax], 0	; test if rax element of rdi if not equal to 0
	jne	loop		; if not loop
	ret			; else return rax


my_putstr:
	call	my_strlen  	; will return the size of rd1 (1st parameter) on rax
	mov     rdx, rax	; number of bytes to write
	mov	rsi, rdi	; 
	mov     rax, 1		; system call 1 is write
	mov     rdi, 1		; file handle 1 is stdout
	syscall			; invoke operating system to do the write
	ret

my_putnbr:
	;; if (nb < 0)
	cmp	edi, 0		; compare di (first argument) and 0
	jnl	_initialize_rax	; if di below 0 jump to _while_nb
				; else
	push	rdi		; save di
	mov	edi, '-'	; put '-' on di
	call	my_putchar	; equivalent my_putchar('-')
	pop	rdi		; restore di
	neg	edi		; change the sign of di
_initialize_rax:	
	xor	eax, eax	; initialize the return value
	;; while loop -> while (nb)
_while_nb:
	cmp	edi, 0		; compare di and 0
	je	_aff_number		; if di equal 0 jump to _return
	inc	eax		; increment ax for each number print
	push	rax		; save ax for the next operation
	;; divide rdi by 10 and get the rest
	mov	eax, edi	; move di in ax (dividende)
	mov	ebx, 10		; move 10 in bx (diviseur)
	xor	edx, edx	; avoiding floating point exeption <=> mov edx, 0
	div	ebx		; div bx by ax and store the result in ax and the rest in dx
	;; print the unite of the number in parameter
	push	rax		; save the result of the division
	add	edx, 48		; 48 is 0 on the ascii table
	;; restore the variable and loop
	pop	rdi		; move the result of the division in di
	pop	rax		; restore ax
	push	rdx		; push unite number on the stack
	jmp	_while_nb	; recall the loop
_aff_number:
	cmp	eax, 0		; compare ax and 0
	je	_return		; if ax equal 0 goto return
				; else
	dec	eax		; decrement ax
	pop	rdi		; 
	push	rax		; save ax
	call	my_putchar	; 
	pop	rax		; restore ax
	jmp	_aff_number	; loop
_return:
	ret			; return ax

