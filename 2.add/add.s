@
@ Example of the ADD/ADC instructions
@
.global _start

@ Multiply 2 by -1 by using MVN and then adding 1
_start:
	MVN R0, #2
	ADD R0, #1 @ Assembler makes this ADD R0, R0, #1

	MOV R7, #1
	SVC 0
