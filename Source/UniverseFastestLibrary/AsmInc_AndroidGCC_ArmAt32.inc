.macro TabJmp Offset, TmpReg						//跳转表的跳转。

	ldr			\TmpReg, [ pc, \Offset, lsl #2 ]
	add			pc, \TmpReg

.endm
