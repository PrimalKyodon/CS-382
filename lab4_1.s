/*******************************************************************************
 * Author  : Aaren Patel
 * Date    : October 3, 2023
 * Pledge  : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/ 

.text
.global _start

_start:

	ADR X1, side_a
	ADR X2, side_b
	ADR X3, side_c

	LDR X1, [X1]
	LDR X2, [X2]
	LDR X3, [X3]

	MUL X1, X1, X1
	MUL X2, X2, X2
	MUL X3, X3, X3

	ADD X4, X1, X2

	SUB X4, X4, X3

	CBZ X4, L1
	CBNZ X4, L2

L1: ADR X1, yes
	ADR X2, len_yes
	B L3

L2: ADR X1, no
	ADR X2, len_no

L3: LDR X2, [X2]
	MOV X0, 1
	MOV X8, 64
	SVC 0


	MOV X0, 0 //Sets X0 to 0 for program termination
	MOV X8, 93 //Sets X8 to termination call
	SVC 0 //System call


.data
	side_a: .quad 3
	side_b: .quad 4
	side_c: .quad 5
	yes: .string "It is a right triangle.\n"
	len_yes: .quad . - yes // Calculate the length of string yes
	no: .string  "It is not a right triangle.\n"
	len_no: .quad . - no // Calculate the length of string no
