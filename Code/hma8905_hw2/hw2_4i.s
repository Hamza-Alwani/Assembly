.global isEqual

.text

isEqual:

	TEQ R0,R1
	BEQ true
	MOV R0,#0
	BX LR

true:
	MOV R0,#1
	BX LR
