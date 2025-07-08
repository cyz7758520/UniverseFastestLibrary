.include "AsmInc_LinuxGCC_x64.inc"


.text


	.align		16
.global MutexLocked
MutexLocked:

	mov         al, 1						# ����alΪ1��
	xchg        al, byte ptr [ rdi ]		# ԭ�ӽ���al�ͻ�������ֵ��
	test        al, al						# �ж�al�Ƿ�Ϊ0��
	je          MutexLockedOut				# ���alΪ0���ͱ�ʾ�ɹ�����ת��MutexLockedOut��
	
	ReTry:
	mov			rax, 100					# ����ѭ��100�Ρ�
	LoopPause:
	pause									# �߳����ߡ�
	dec			rax							# ����raxΪrax-1��
	jne			LoopPause					# ���rax��Ϊ0������ת��LoopPause��

	mov         al, 1						# ����alΪ1��
	xchg        al, byte ptr [ rdi ]		# ԭ�ӽ���al�ͻ�������ֵ��
	test        al, al						# �ж�al�Ƿ�Ϊ0��
	jne         ReTry						# ���al��Ϊ0���ͱ�ʾʧ�ܣ���ת��ReTry��

	MutexLockedOut:
	ret


	.align		16
.global MutexUnlock
MutexUnlock:

	mov			byte ptr [ rdi ], 0			# ���û�������ֵΪ0��

	ret
