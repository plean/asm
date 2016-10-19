	global my_strlen		; make label available to linker

my_strlen:
	mov     rax, -1			; set the return value at -1

loop:
        inc     rax			; increment rax
	cmp     byte [rdi + rax], 0     ; test if rax element of rdi if not equal to 0
	jne     loop			; if not loop
	ret				; else return rax
