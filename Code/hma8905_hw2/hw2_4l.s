.global  maxS32

.text

maxS32:
	CMP R0,R1
	MOVGT R0,R0
	MOVLE R0,R1
	BX LR
