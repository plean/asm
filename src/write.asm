	extern  _GLOBAL_OFFSET_TABLE_
	global write:function

write:
	mov	rax, 1
	syscall
	ret
