.include "AsmInc_AndroidGCC_ArmA64.inc"


.text


	.align		6											//64�ֽڶ��롣
.global MutexLocked
MutexLocked:

	mov			w2, 1										//����w2Ϊ1��

	ldxrb		w1, [ x0 ]									//�ѻ�������ֵ��ֵ��չ��ȡ��w1��
	cbnz		w1, Yield									//���w1������0������ת��Yield��
	stxrb		w1, w2, [ x0 ]								//���û�������ֵΪw2��1��������Ƿ�ɹ���w1��
	cbz			w1, MutexLockedOut							//���w1����0���ͱ�ʾ�ɹ�����ת��MutexLockedOut��

	Yield:
	mov			x3, x0										//�ѻ������ĵ�ַx0���Ƶ�x3��
	mov			x8, 0x7C									//����x8Ϊ0x7C��

	ReTry:
	svc			0											//����sched_yield�������ú���������x0Ϊ0��ʵ���ѭ��ִ��yieldָ��Ҫ�졣

	ldxrb		w1, [ x3 ]									//�ѻ�������ֵ��ֵ��չ��ȡ��w1��
	cbnz		w1, ReTry									//���w1������0������ת��ReTry��
	stxrb		w1, w2, [ x3 ]								//���û�������ֵΪw2��1��������Ƿ�ɹ���w1��
	cbnz		w1, ReTry									//���w1������0���ͱ�ʾʧ�ܣ���ת��ReTry��

	MutexLockedOut:
	ret


	.align		6											//64�ֽڶ��롣
.global MutexUnlock
MutexUnlock:

	stlr		wzr, [ x0 ]									//���û�������ֵΪ0��

	ret
