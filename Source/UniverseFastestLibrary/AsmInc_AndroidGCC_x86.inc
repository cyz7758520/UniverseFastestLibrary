.intel_syntax noprefix

.macro GetGotPt GotPtReg							# 获取全局偏移表的地址。

	call		GetGotPopBefore\@
	GetGotPopBefore\@:
	pop			\GotPtReg
	GetGotPopAfter\@:
	.att_syntax prefix
	addl		$_GLOBAL_OFFSET_TABLE_ + ( GetGotPopAfter\@ - GetGotPopBefore\@ ), %\GotPtReg
	.intel_syntax noprefix

.endm

.macro TabJmp TabName, Offset, GotPtReg, TmpReg		# 跳转表的跳转。

	mov			\TmpReg, dword ptr [ \GotPtReg + \TabName@GOTOFF + \Offset * 4 ]
	add			\TmpReg, \GotPtReg
	jmp			\TmpReg

.endm
