.macro TabJmp TabName, Offset, TmpReg1, TmpReg2, TmpReg2_w	//跳转表的跳转。

	adr			\TmpReg1, \TabName
	ldr			\TmpReg2_w, [ \TmpReg1, \Offset, lsl #2 ]
	add			\TmpReg2, \TmpReg2, \TmpReg1
	br			\TmpReg2

.endm
