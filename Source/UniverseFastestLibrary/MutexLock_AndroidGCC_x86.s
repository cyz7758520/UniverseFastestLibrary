.include "AsmInc_AndroidGCC_x86.inc"


.text


	.align		16
.global MutexLocked
MutexLocked:

	mov         ecx, dword ptr [ esp + 4 ]	# ����ecxΪ�������ĵ�ַ��

	mov         al, 1						# ����alΪ1��
	xchg        al, byte ptr [ ecx ]		# ԭ�ӽ���al�ͻ�������ֵ��
	test        al, al						# �ж�al�Ƿ�Ϊ0��
	je          MutexLockedOut				# ���alΪ0���ͱ�ʾ�ɹ�����ת��MutexLockedOut��

	ReTry:
	mov			eax, 100					# ����ѭ��100�Ρ�
	LoopPause:
	pause									# �߳����ߡ�
	dec			eax							# ����eaxΪeax-1��
	jne			LoopPause					# ���eax��Ϊ0������ת��LoopPause��

	mov         al, 1						# ����alΪ1��
	xchg        al, byte ptr [ ecx ]		# ԭ�ӽ���al�ͻ�������ֵ��
	test        al, al						# �ж�al�Ƿ�Ϊ0��
	jne         ReTry						# ���al��Ϊ0���ͱ�ʾʧ�ܣ���ת��ReTry��

	MutexLockedOut:
	ret
    

	.align		16
.global MutexUnlock
MutexUnlock:

    mov			ecx, dword ptr [ esp + 4 ]	# ����ecxΪ�������ĵ�ַ��

	mov			byte ptr [ ecx ], 0			# ���û�������ֵΪ0��

	ret
