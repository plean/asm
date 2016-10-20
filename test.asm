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
	cmp	edi, 0		; compare edi (first argument) and 0
	jnl	_initialize_rax	; if edi below 0 jump to _while_nb
				; else
	push	rdi		; save rdi
	mov	edi, '-'	; else put '-' on rdi
	call	my_putchar	; equivalent my_putchar('-')
	pop	rdi		; restore rdi
	neg	edi		; change the sign of edi
_initialize_rax:	
	xor	eax, eax	; initialize the return value
	;; while loop -> while (nb)
_while_nb:
	cmp	edi, 0		; compare edi and 0
	je	_return		; if rdi equal 0 jump to _return
	inc	eax		; increment eax for each number print
	push	rax		; save rax for the next operation
	;; divide rdi by 10 and get the rest
	mov	eax, edi	; move edi in eax (dividende)
	mov	ebx, 10		; move 10 in ebx (diviseur)
	xor	edx, edx	; avoiding floating point exeption <=> mov edx, 0
	div	ebx		; div ebx by eax and store the result in eax and the rest in edx
	;; print the unite of the number in parameter
	push	rax		; save the result of the division
	mov	edi, edx	; here edx is equal to edi % 10
				; we need to print this number
	add	edi, 48		; 48 is 0 in the ascii table
	call	my_putchar	; print edi
	;; restore the variable and loop
	pop	rdi		; move the result of the division in rdi
	pop	rax		; restore rax
	jmp	_while_nb	; recall the loop
_return:
	ret			; return rax

__tmp:	
	cmp	edi, 0		; compare edi and 0
	je	_return		; if rdi equal 0 jump to _return
	inc	eax		; increment eax for each number print
	push	rax		; save rax for the next operation
	;; divide rdi by 10 and get the rest
	mov	eax, edi	; move edi in eax (dividende)
	mov	ebx, 10		; move 10 in ebx (diviseur)
	xor	edx, edx	; avoiding floating point exeption <=> mov edx, 0
	div	ebx		; div ebx by eax and store the result in eax and the rest in edx
	;; print the unite of the number in parameter
	push	rax		; save the result of the division
	mov	edi, edx	; here edx is equal to edi % 10
				; we need to print this number
	add	edi, 48		; 48 is 0 in the ascii table
	call	my_putchar	; print edi
	;; restore the variable and loop
	pop	rdi		; move the result of the division in rdi
	pop	rax		; restore rax
	jmp	_while_nb	; recall the loop

