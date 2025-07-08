.intel_syntax noprefix

.macro TabJmp TabName, Offset, TmpReg1, TmpReg2		# 跳转表的跳转。

	lea			\TmpReg1, qword ptr [ rip + \TabName ]
	movsxd		\TmpReg2, dword ptr [ \TmpReg1 + \Offset ]
	add			\TmpReg2, r8
	jmp			\TmpReg2

.endm
