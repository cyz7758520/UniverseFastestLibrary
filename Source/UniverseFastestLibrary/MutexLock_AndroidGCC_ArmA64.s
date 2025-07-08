.include "AsmInc_AndroidGCC_ArmA64.inc"


.text


	.align		6											//64字节对齐。
.global MutexLocked
MutexLocked:

	mov			w2, 1										//设置w2为1。

	ldxrb		w1, [ x0 ]									//把互斥锁的值零值扩展读取到w1。
	cbnz		w1, Yield									//如果w1不等于0，就跳转到Yield。
	stxrb		w1, w2, [ x0 ]								//设置互斥锁的值为w2的1，并存放是否成功到w1。
	cbz			w1, MutexLockedOut							//如果w1等于0，就表示成功，跳转到MutexLockedOut。

	Yield:
	mov			x3, x0										//把互斥锁的地址x0复制到x3。
	mov			x8, 0x7C									//设置x8为0x7C。

	ReTry:
	svc			0											//调用sched_yield函数，该函数会设置x0为0。实测比循环执行yield指令要快。

	ldxrb		w1, [ x3 ]									//把互斥锁的值零值扩展读取到w1。
	cbnz		w1, ReTry									//如果w1不等于0，就跳转到ReTry。
	stxrb		w1, w2, [ x3 ]								//设置互斥锁的值为w2的1，并存放是否成功到w1。
	cbnz		w1, ReTry									//如果w1不等于0，就表示失败，跳转到ReTry。

	MutexLockedOut:
	ret


	.align		6											//64字节对齐。
.global MutexUnlock
MutexUnlock:

	stlr		wzr, [ x0 ]									//设置互斥锁的值为0。

	ret
