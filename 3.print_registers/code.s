@
@ Assembler program to print a register in hex to stdout
@ R0-R2 - parameters to linux function services
@ R1 - is also address of byte we are writing
@ R4 - register to print
@ R5 - loop index
@ R6 - current character
@ R7 - linux function number
@

.global _start
_start:
	MOV R4, #0x12AB @ lower bits of number to print
	MOVT R4, #0xDE65 @ high bits of number to print
	LDR R1, =hexstr @ start of string
	ADD R1, #9 @ start at least sig digit

	@ for R5 = 8 to 1 step -1
	MOV R5, #8 @ 8 digits to print
	loop:
		AND R6, R4, #0xF @ mask of least sig digit
		@ if R6 >= 10 then goto letter
		CMP R6, #10 @ is 0-9 or A-F
		BGE letter
		@ else its a number so convert to an ASCII digit
		ADD R6, #'0'
		B cont  @ goto to end if

		letter: @ handle the digits A to F
			ADD R6, #('A' - 10)
		cont: @ end if

		STRB R6, [R1] @ store ASCII digit
		SUB  R1, #1   @ decerement address for next digit
		LSR  R4, #4   @ shift off the digit we just processed

		@ next R5
		SUBS R5, #1 @ step R5 by -2
		BNE loop @ another loop if not done

	@ Print hex number
	MOV R0, #1
	LDR R1, =hexstr
	MOV R2, #11
	MOV R7, #4
	SVC 0

	MOV R0, #0
	MOV R7, #1
	SVC 0

.data
	hexstr: .ascii "0x12345678\n"
