.global isEqual32

.text


isEqual32:
	SUB R0,R1
	CMP R0,#0 
	BEQ true
	MOV R0,#0
	BX LR

true:

	MOV R0,#1
	BX LR
