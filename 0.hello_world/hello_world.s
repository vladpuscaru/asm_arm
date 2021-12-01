@
@ Assembler program to print "Hello, World!"
@ to stdout.
@
@ R0-R2 parameters to linux function services
@ R7    linux function number

.global _start @ Provide program starting

_start:
	mov R0, #1 @ 1 = Standard Output
	ldr R1, =helloworld
	mov R2, #13 @ length of the string
	mov R7, #4 @ linux write syscall
	svc 0 @ syscall
	
	@ Exit the program
	mov R0, #0
	mov R7, #1
	svc 0 @ syscall
	
.data
	helloworld: .ascii "Hello, World!\n"
	
