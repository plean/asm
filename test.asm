	SECTION .data			; data section
msg:		db "Hello World", 10	; the string to print, 10=cr
len:		equ $-msg		; "$" means "here"
	;;  len is a value, not an address
char:		db 'a'

	SECTION .text		; code section
	global my_strlen	; make label available to linker

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
	pop	rdi		; restore rsp
	ret
	

my_strlen:
	mov	rax, -1		; set the return value at -1

loop:
	inc	rax		; increment rax
	cmp	byte [rdi + rax], 0	; test if rax element of rdi if not equal to 0
	jne	loop		; if not loop
	ret			; else return rax
