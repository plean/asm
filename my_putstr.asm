	extern	my_strlen
	global	my_putstr
	
my_putstr:
	call    my_strlen ; will return the size of rd1 (1st parameter) on rax
	mov     rdx, rax  ; number of bytes to write
	mov     rsi, rdi  ;
	mov     rax, 1	  ; system call 1 is write
	mov     rdi, 1	  ; file handle 1 is stdout
	syscall		  ; invoke operating system to do the write
	ret
	
