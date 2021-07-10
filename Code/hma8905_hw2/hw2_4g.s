.global  shiftS32

.text

shiftS32:
	CMP R1,#0
	BMI negreg
	lsl R0,R0,R1
	BX LR


negreg:
	
	MVN R2,R1
	ADD R2,R2,#1
	CMP R0, #0
	BMI negnum
	LSR R0,R0,R2
	BX LR

negnum:

	ASR R0,R0,R2
	BX LR





