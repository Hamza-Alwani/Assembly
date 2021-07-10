.global fsum

.text


fsum:

    MOV R2, #0
    MOV R2, #0
    VMOV D0, R2, R2 
fsum_loop:
    CMP R1, #0
    BEQ fsum_end
    VLDR D1, [R0]
    ADD R0, R0, #8
    VADD.F64 D0, D0, D1
    SUB R1, R1, #1
    B fsum_loop

fsum_end:
    VMOV R0, R1, D0
    BX LR
