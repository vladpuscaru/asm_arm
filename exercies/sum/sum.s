

.data
	no1: .byte 3
	no2: .byte 5

.text
.global _start
_start:
	LDR R1, addr_no1
	LDR R2, addr_no2
	ADD R3, R1, R2

	MOV R7, #1
	MOV R0, #0
	SVC 0

addr_no1: .word no1
addr_no2: .word no2
