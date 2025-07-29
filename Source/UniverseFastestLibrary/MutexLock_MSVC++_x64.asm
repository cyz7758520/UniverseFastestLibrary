include AsmInc_MSVC++_x64.inc


_code segment read execute shared align( 64 ) 'code'


	align		64							; 64字节对齐。
public MutexLocked
MutexLocked:

	mov         al, 1						; 设置al为1。
	xchg        al, byte ptr [ rcx ]		; 原子交换al和互斥锁的值。
	test        al, al						; 判断al是否为0。
	je          MutexLockedOut				; 如果al为0，就表示成功，跳转到MutexLockedOut。

	ReTry:
	mov			rax, 100					; 设置循环100次。
	LoopPause:
	pause									; 线程休眠。
	dec			rax							; 设置rcx为rcx-1。
	jne			LoopPause					; 如果rcx不为0，就跳转到LoopPause。

	mov         al, 1						; 设置al为1。
	xchg        al, byte ptr [ rcx ]		; 原子交换al和互斥锁的值。
	test        al, al						; 判断al是否为0。
	jne         ReTry						; 如果al不为0，就表示失败，跳转到ReTry。

	MutexLockedOut:
	ret


	align		4							; 4字节对齐。因为后续2个指令只有4个字节。
public MutexUnlock
MutexUnlock:

	mov			byte ptr [ rcx ], 0			; 设置互斥锁的值为0。

	ret

_code ends


end
