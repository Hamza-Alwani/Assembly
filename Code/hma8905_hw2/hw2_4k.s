.global maxU32

.text

maxU32:
	CMP R0,R1
	MOVLE  R0, R1
	MOVGT  R0, R0

	BX LR
