.global findName

.text


findName:
/*	R0= const struct
	R1= uint32_t count
	R2= char name
	retrun  index
*/

	PUSH {R4,R5,R6,R7}
	MOV R3,R0
	ADD R3,#4
	MOV R4, R2
	MOV R5,R3
	MOV R0,#0
	MOV R6,#0
	MOV R7,#0

/*R5= og thang
R4=  to cmp
r6 pointer  array
r7 count
*/

loop1:
LDRB R4,[R2,R6]
LDRB R5, [R3,R6]

CMP R4,#0
BEQ exit

CMP  R5,R4
ADD R6,R6,#1
BEQ loop1

addone:
ADD R7,R7,#1
MOV R6,#0
ADD R0,R0,#1
ADD R3, R3, #115
MOV R5, R3
MOV R4, R2
CMP R7,R1
BEQ exit
B loop1


exit:
POP {R4,R5,R6,R7}
BX LR





















/*
	MOV R3,R0
	MOV R0,#0
	ADD R3,#4
	MOV R6, R2
	MOV R7,	R3
	PUSH {R4,R5}
findname_loop:


findname_loop2:
LDR R4, [R6]
LDR R5, [R7]
CMP R4,#0
BEQ findname_exit
CMP R4 ,R5
ADD R6,R6,#1
ADD R7,R7,#1
BEQ findname_loop2


	ADD R0,R0,#1
	ADD R3,#115
	Bfindname_loop:

findname_exit:
POP {R4,R5}
BX LR

*/


