.global scale


.text

scale:
/*
params
R0=return value   (empty array double]
R1=full aray double
R2= scale
R3=count

R4= copy of R1 pointer
R5= copy of R0 pointer
*/

PUSH {R4,R5,R6}
MOV R4,R1
MOV R5,#0
VMOV D1,R5,R5

VMOV S0, R2
VCVT.F64.U32 D1,S0



loop:
CMP R3,#0
BEQ scale_exit

VLDR D0, [R4]
VMUL.F64 D0,D0,D1


VSTR D0, [R0]



SUB R3,R3,#1
ADD R4,R4,#8
ADD R0,R0,#8
B loop

scale_exit:
POP {R4,R5,R6}
BX LR
