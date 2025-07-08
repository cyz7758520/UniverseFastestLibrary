.intel_syntax noprefix

.macro TabJmp TabName, Offset, TmpReg				# 跳转表的跳转。

	lea			\TmpReg, \TabName[ rip ]
	jmp			qword ptr [ \TmpReg + \Offset ]

.endm
