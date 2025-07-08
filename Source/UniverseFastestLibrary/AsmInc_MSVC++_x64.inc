option casemap :none

TabJmp macro TabName, Offset, TmpReg				; 跳转表的跳转。

	lea			&TmpReg, offset &TabName			; 这里用lea指令比用mov指令要快，因为lea指令长7字节，mov指令长10字节。
	jmp			qword ptr [ &TmpReg + &Offset ]

endm
