.model flat, c
option casemap :none

TabJmp macro TabName, Offset						; 跳转表的跳转。

	jmp			dword ptr [ offset &TabName + &Offset ]

endm
