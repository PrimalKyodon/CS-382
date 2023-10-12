/*******************************************************************************
 * Author  : Aaren Patel
 * Date    : September 19, 2023
 * Pledge  : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/


.text
.global _start

_start:
	//Sets X0 to 1 for printing
	MOV X0, 1
	//Loads msg address into X1
	ADR X1, msg
	//Loads len address into X2
	ADR X2, len
	//Stores len into X2
	LDR X2, [X2]
	
	//Sets X8 to print call
	MOV X8, 64
	//Syscall
	SVC 0
	
	//Sets X0 to 0 for program termination
	MOV X0, 0
	//Sets X8 to termination call
	MOV X8, 93
	//System call
	SVC 0

.data
	msg: .string "Hello World!\n"
	len: .quad 13
