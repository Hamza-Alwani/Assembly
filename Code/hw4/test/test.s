.global match

.text


match:
	MOV R2,R0
	MOV R3,R1
	MOV R0,#0

	LDR R4,[R2]
	LDR R5,[R3]
	CMP R4,R5
 	MOVEQ R0,#1
	BEQ first
	BX LR

first:
	LDR R4,[R2,#1]
        LDR R5,[R3,#1]
        CMP R4,R5
        MOVEQ R0,#10
	BX LR
