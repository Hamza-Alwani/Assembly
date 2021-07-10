.global add32_64

.text

add32_64:

	ADDS R0,R1,R0
	MOVVS R1, #1
	MOVVC R1, #0
	BX LR


