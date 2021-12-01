@
@ Examples of the MOV instruction.
@
.global _start

_start:
	@ Load R2 with 0x4F5D6E3A first using MOV and then MOVT
	@ MOV will load the 16 lower bits
	@ MOVT (MOV Top) will load the 16 top bits
	MOV R2, #0x6E3A
	MOVT R2, #0x4F5D

	@ Mov R2 into R1
	MOV R1, R2

	@ Shift versions of MOV
	MOV R1, R2, LSL #1 @ Logical shift left
	MOV R1, R2, LSR #1 @ Logical shift right
	MOV R1, R2, ASR #1 @ Arithmetic shift right
	MOV R1, R2, ROR #1 @ Rotate right
	MOV R1, R2, RRX    @ Rotate right extended (uses the Carry flag as the extra 33rd bit)

	@ Repeat the above shifts using Assembler mnemonics
	@ The machine code will be the same
	LSL R1, R2, #1
	LSR R1, R2, #1
	ASR R1, R2, #1
	ROR R1, R2, #1
	RRX R1, R2

	@ Example that works with 8-bit immediate and shift
	MOV R1, #0xAB000000 @ Too big for #imm16

	@ Example that can't be represented and results in an error
	@ MOV R1, #0xABCDEF11 @ Too big for #imm16

	@ Example of MVN (MOV NOT)
	MVN R1, #46

	@ Example of MOV that Assembler will change to MVN
	MOV R1, #0xFFFFFFFE @ (-2)

	@ Exit the program
	MOV R0, #0
	MOV R7, #1
	SVC 0
