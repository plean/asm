	extern  _GLOBAL_OFFSET_TABLE_
	global putc:function	; make label available to linker

putc:

	push	rdi		; push rdi (argument 1) on top of the stack
	mov	rsi, rsp	; rsp is pointing on rdi (1st argument)
	mov     rax, 1		; system call 1 is write
	mov     rdi, 1		; file handle 1 is stdout
	mov     rdx, 1		; number of bytes to write
	syscall			; invoke operating system to do the write
	pop	rdi		; restore the stack
	ret
	
