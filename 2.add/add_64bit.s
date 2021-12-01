@
@ Example of 64-bit addition with the ADD/ADC instructions
@
.global _start

@ Load the registers with some data
@ First 64-bit number is   0x00000003FFFFFFFF
@ Second 64-bit number is  0x0000000500000001
_start:
	@ Load the first 64-bit number into R2 and R3
	MOV R2, #0x00000003 @ Higher order word
	MOV R3, #0xFFFFFFFF @ Lower order word

	@ Load the second 64-bit number into R4 and R6
	MOV R4, #0x00000005 @ Higher order word
	MOV R5, #0x00000001 @ Lower order word

	ADDS R1, R3, R5 @ Add the lower order word and set carry flag
	ADC R0, R2, R4 @ Add the higher order word + the carry flag

	MOV R7, #1
	SVC 0

	@ The final number is located in R0 and R1
	@ R0 - Higher word 00000009
	@ R1 - Lower word  00000000

	@ 00000003 FFFFFFFF +
	@ 00000005 00000001
	@ -----------------
	@ 00000009 00000000


