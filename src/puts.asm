	extern  _GLOBAL_OFFSET_TABLE_
	global	puts:function

_strlen:
	mov     rax, -1		; set the return value at -1

_loop:
	inc     rax	; increment rax
	cmp     byte [rdi + rax], 0 ; test if rax element of rdi if not equal to 0
	jne     _loop		    ; if not loop
	ret			    ; else return rax
	
putstr:
	call    _strlen ; will return the size of rd1 (1st parameter) on rax
	mov     rdx, rax  ; number of bytes to write
	mov     rsi, rdi  ;
	mov     rax, 1	  ; system call 1 is write
	mov     rdi, 1	  ; file handle 1 is stdout
	syscall		  ; invoke operating system to do the write

