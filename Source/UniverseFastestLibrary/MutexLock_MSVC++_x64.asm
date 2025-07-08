include AsmInc_MSVC++_x64.inc


.code


	align		16
public MutexLocked
MutexLocked:

	mov         al, 1						; ����alΪ1��
	xchg        al, byte ptr [ rcx ]		; ԭ�ӽ���al�ͻ�������ֵ��
	test        al, al						; �ж�al�Ƿ�Ϊ0��
	je          MutexLockedOut				; ���alΪ0���ͱ�ʾ�ɹ�����ת��MutexLockedOut��

	ReTry:
	mov			rax, 100					; ����ѭ��100�Ρ�
	LoopPause:
	pause									; �߳����ߡ�
	dec			rax							; ����rcxΪrcx-1��
	jne			LoopPause					; ���rcx��Ϊ0������ת��LoopPause��

	mov         al, 1						; ����alΪ1��
	xchg        al, byte ptr [ rcx ]		; ԭ�ӽ���al�ͻ�������ֵ��
	test        al, al						; �ж�al�Ƿ�Ϊ0��
	jne         ReTry						; ���al��Ϊ0���ͱ�ʾʧ�ܣ���ת��ReTry��

	MutexLockedOut:
	ret


	align		16
public MutexUnlock
MutexUnlock:

	mov			byte ptr [ rcx ], 0			; ���û�������ֵΪ0��

	ret


end
