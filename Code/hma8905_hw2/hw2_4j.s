.global isEven

.text

isEven:
  	AND R0, #1
 	RSB R0, R0, #1
	EOR R0, R0, #1
	CMP R0,#0
	MOVEQ R0,#1
	MOVNE R0,#0
	BX LR
