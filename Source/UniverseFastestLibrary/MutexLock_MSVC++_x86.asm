include AsmInc_MSVC++_x86.inc


_code segment read execute shared align( 64 ) 'code'


	align		64							; 64字节对齐。
public MutexLocked
MutexLocked:

	mov         ecx, dword ptr [ esp + 4 ]	; 设置ecx为互斥锁的地址。

	mov         al, 1						; 设置al为1。
	xchg        al, byte ptr [ ecx ]		; 原子交换al和互斥锁的值。
	test        al, al						; 判断al是否为0。
	je          MutexLockedOut				; 如果al为0，就表示成功，跳转到MutexLockedOut。

	ReTry:
	mov			eax, 100					; 设置循环100次。
	LoopPause:
	pause									; 线程休眠。
	dec			eax							; 设置eax为eax-1。
	jne			LoopPause					; 如果eax不为0，就跳转到LoopPause。

	mov         al, 1						; 设置al为1。
	xchg        al, byte ptr [ ecx ]		; 原子交换al和互斥锁的值。
	test        al, al						; 判断al是否为0。
	jne         ReTry						; 如果al不为0，就表示失败，跳转到ReTry。

	MutexLockedOut:
	ret


	align		8							; 8字节对齐。因为后续3个指令只有8个字节。
public MutexUnlock
MutexUnlock:

	mov			ecx, dword ptr [ esp + 4 ]	; 设置ecx为互斥锁的地址。

	mov			byte ptr [ ecx ], 0			; 设置互斥锁的值为0。

	ret

_code ends


end
