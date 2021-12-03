

.section .text
.global _start
_start:
	MOV R0, PC
	ADD R1, R0, R0
	ADD R2, R0, R1
	bkpt
