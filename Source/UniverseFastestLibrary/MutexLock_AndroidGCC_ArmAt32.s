.include "AsmInc_AndroidGCC_ArmAt32.inc"


.text


	.align		6											//64�ֽڶ��롣
.global MutexLocked
MutexLocked:

	mov			r2, 1										//����r2Ϊ1��

	ldrexb		r1, [ r0 ]									//�ѻ�������ֵ��ֵ��չ��ȡ��r1��
	teq			r1, 0										//�ж�r1�Ƿ����0��
	bne			Yield										//���r1������0������ת��Yield��
	strexb		r1, r2, [ r0 ]								//���û�����Ϊr2��1��������Ƿ�ɹ���r1��
	teq			r1, 0										//�ж�r1�Ƿ����0��
	beq			MutexLockedOut								//���r1����0���ͱ�ʾ�ɹ�����ת��MutexLockedOut��

	Yield:
	mov			r3, r0										//�ѻ������ĵ�ַr0���Ƶ�r3��
	mov			r12, r7										//��r7���ݵ�r12��
	mov			r7, 0x9E									//����r7Ϊ0x9E��

	ReTry:
	svc			0											//����sched_yield�������ú���������r0Ϊ0��ʵ���ѭ��ִ��yieldָ��Ҫ�졣

	ldrexb		r1, [ r3 ]									//�ѻ�������ֵ��ֵ��չ��ȡ��r1��
	teq			r1, 0										//�ж�r1�Ƿ����0��
	bne			ReTry										//���r1������0������ת��ReTry��
	strexb		r1, r2, [ r3 ]								//���û�����Ϊr2��1��������Ƿ�ɹ���r1��
	teq			r1, 0										//�ж�r1�Ƿ����0��
	bne			ReTry										//���r1������0���ͱ�ʾʧ�ܣ���ת��ReTry��

	mov			r7, r12										//�ָ�r7Ϊr12��

	MutexLockedOut:
	bx			lr


	.align		6											//64�ֽڶ��롣
.global MutexUnlock
MutexUnlock:
    
	mov			r1, 0										//����r1Ϊ0��
	dmb			ish											//�����ڴ����ϡ�
	strb		r1, [ r0 ]									//����r0Ϊr1��0��
	dmb			ish											//�����ڴ����ϡ�

	bx			lr
