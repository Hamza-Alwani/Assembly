.global sum
.global max
.global match
.global sortAscendingInPlace
.global sortAscendingCopy
.global reverseString
.global decimalToInt32
.global hexToUint32
.global bro
.global isEvenParity



.text

.data
maximum: .long 0xFFFFFFF




@SUM
	sum:
		PUSH {R4,R5,R6}
		MOV R2,R0
		MOV R0,#0
		MOV R3,R1
		MOV R1, #0

	sum_loop:
		CMP R3,#0
		BEQ sum_end
		LDR R4,[R2],#4
		MOV R5,R0

		ADDS R0,R0,R4
		ADDCS  R1,R1,#1
		SUB R3,R3, #1
		B sum_loop


	sum_end:
		POP {R4,R5,R6}
		BX LR





@MAX
	max:

		MOV R2,R0
		MOV R0, #0

	max_loop:

		CMP R1,#0
		BEQ max_end
		LDR R3, [R2], #4
		CMP R3,R0
		MOVGE R0,R3
		SUB R1,R1,#1
		B max_loop

	max_end:
		POP {R4}
		BX LR





@MATCH
	match:

		PUSH {R4,R5}

		MOV R4,R0
		MOV R0,#0
	match_loop:
		CMP R2,#0
		BEQ  match_end
		LDR R5,[R4],#4
		CMP R5,R1
		ADDEQ R0,R0,#1
		SUB R2, R2,#1
		B match_loop
	match_end:
		POP {R4,R5}
		BX LR





@sort_place
	sortAscendingInPlace:
			PUSH {R4, R5, R6, R7, R8}
			CMP R1, #1

			BLE sp_end_outer

			SUB R5, R1, #1
			MOV R4, R0
			MOV R6, #0

	sp_loop_start:
			LDR R7, [R4],#4
			LDR R8, [R4]
			CMP R7, R8
			BLE no_swap

			MOV R6,#1
			SUB R4, R4, #4
			STRGE R8, [R4]
			STRGE R7, [R4,#4]
	no_swap:
			 SUBS R5, R5, #1
			 BNE sp_loop_start
	sp_end_inner:
			 CMP R6, #0
			 BEQ sp_end_outer

			MOV R6, #0
			MOV R4, R0
			SUB R5, R1, #1
			B sp_loop_start

	sp_end_outer:
			POP {r4, r5, r6, r7, r8}
			BX LR






@sort_copy		
	sortAscendingCopy:

		PUSH {R4,R5,R6,R7}
		MOV R3, R1 @point R# to og
		LDR R4,[R3]
		MOV R6,#0
		MOV R8,R2

	sc_loop:
		CMP R2,#0
		BEQ sc_exit
		MOV R7,R8
		MOV R3,R1
	sc_loop1:
		CMP R7,#0
		BEQ sc_add

		LDR R5, [R3],#4 	@increment 4

		CMP R5,R6
		SUBLE R7,R7,#1
		BLE sc_loop1

		CMP R5,R4
		MOVLE R4,R5

		SUB R7,R7,#1
		B sc_loop1


	sc_add:
		STR R4 ,[R0]
		ADD R0, R0, #4
		SUB R2,R2,#1
		MOV R6,R4
		LDR R4,maximum
		B sc_loop


	sc_exit:
		POP {R4,R5,R6,R7}
		BX LR

	


@reversestring
	reverseString:
		PUSH {R4,R5}
		MOV R2,#0
		MOV R5,R1
	rs_count:
		LDRB R3, [R1], #1
		CMP R3, #0
		BEQ rs_start
		ADD R2, R2, #1
		B rs_count

	rs_start:
	rs_loop:
		SUB R2,R2,#1
		MOV R1,R5
		ADD R1,R1,R2
		LDRB R4,[R1]
		STR R4,[R0],#1
		CMP R2,#0
		BEQ rs_end
		B rs_loop

	rs_end:
		POP {R4,R5}
		BX LR




@ d to U
	decimalToInt32:
		PUSH {R4}
		MOV R1,R0
		MOV R0,#0
		MOV R4,#10

	convert:
		LDRB R2,[R1],#1
		CMP R2,#45
		BEQ convert_neg
		TST R2,R2
		BEQ dti_done

		CMP R2,#48
		BLE dti_error

		CMP R2,#57
		BGT dti_error

		SUB R2,R2,#48
		MUL R0,R0,R4
		ADD R0,R0,R2

		b convert

	convert_neg:
		LDRB R2,[R1],#1
			TST R2,R2
		BEQ dti_done_neg

			CMP R2,#48
			BLE dti_error

			CMP R2,#57
			BGT dti_error

			SUB R2,R2,#48
			MUL R0,R0,R4
			ADD R0,R0,R2
		B convert_neg

	dti_done:
		POP {R4}
		BX LR

	dti_done_neg:
		POP {R4}
		MVN R0,R0
		ADD R0,R0,#1
		BX LR

	dti_error:
		PUSH {R4}
		MOV R0,#0
		BX LR



@ htu
	hexToUint32:
		PUSH {R4,R5,R6,R7}

		MOV R1,R0
		MOV R0,#0
		MOV R4,#16
		MOV R5,#0
		MOV R6,#0
	hcon:
		LDRB R2,[R1],#1
		TST R2,R2
		BEQ hcon_done
		MOV R7,R5
		MOV R6,#0

		CMP R2,#48
		MOVEQ R2, #0
		MOVEQ  R6,#1

		CMP R2,#49
		MOVEQ R2, #1
		MOVEQ  R6,#1

		CMP R2,#50
		MOVEQ R2, #2
		MOVEQ  R6,#1

		CMP R2,#51
		MOVEQ R2, #3
		MOVEQ  R6,#1

		CMP R2,#52
		MOVEQ R2, #4
		MOVEQ  R6,#1

		CMP R2,#53
		MOVEQ R2, #5
		MOVEQ  R6,#1

		CMP R2,#54
		MOVEQ R2, #6
		MOVEQ  R6,#1

		CMP R2,#55
		MOVEQ R2, #7
		MOVEQ  R6,#1

		CMP R2,#56
		MOVEQ R2, #8
		MOVEQ  R6,#1

		CMP R2,#57
		MOVEQ R2, #9
		MOVEQ  R6,#1

		CMP R2,#65
		MOVEQ R2, #10
		MOVEQ  R6,#1

		CMP R2,#66
		MOVEQ R2, #11
		MOVEQ  R6,#1

		CMP R2,#67
		MOVEQ R2, #12
		MOVEQ  R6,#1

		CMP R2,#68
		MOVEQ R2, #13
		MOVEQ  R6,#1

		CMP R2,#69
		MOVEQ R2, #14
		MOVEQ  R6,#1

		CMP R2,#70
		MOVEQ R2, #15
		MOVEQ  R6,#1
		CMP R6, #0
		BEQ hcon_fail
		B hcon_loop

	hcon_loop:
		MUL R0,R4
		CMP R7,R5
		BEQ hcon_add

	hcon_add:
		ADD R0,R0,R2
		ADD R5,R5,#1
		B hcon



	hcon_done:
		POP {R4,R5,R6,R7}
		BX LR

	hcon_fail:
		POP {R4,R5,R6,R7}
		MOV R0, #0
		BX LR


@bro
	bro:
		MOV R1, R0
		MOV R0, #0
		MOV R2, #0x80000000
		MOV R3, #0x00000001 
	bro_loop:
		TST R1, R2
		ORRNE R0, R3
		MOVS R2, R2, LSR #1
		MOV R3, R3, LSL #1
		BNE bro_loop
		BX LR



@iseven	
	isEvenParity:
		MOV R1,R0
		MOV R0,#0
	int32ToBinary:

		MOV R2, #0x80000000 
	u32_loop:
		TST R1, R2
		ADDNE R0,R0, #1
 		MOVS R2, R2, LSR #1
 		BNE u32_loop

		AND R0, #1
 		RSB R0, R0, #1
		EOR R0, R0, #1 
		CMP R0,#0
		MOVEQ R0,#1
		MOVNE R0,#0

		BX LR
