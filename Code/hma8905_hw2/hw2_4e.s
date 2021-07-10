.global  shiftU32


.text

shiftU32:
	CMP  R1, #0
	BMI right
	LSL R0,R0,R1
	BX LR

right:

	MVN R3,R1
	ADD R3,R3,#1
	LSR R0,R0,R3
	BX LR

