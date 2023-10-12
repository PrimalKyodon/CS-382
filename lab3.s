/*******************************************************************************
 * Author  : Aaren Patel
 * Date    : September 26, 2023
 * Pledge  : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/


.text
.global _start

_start:

ADR X1, vec1 //loads address of vec1 into X1
ADR X2, vec2 //loads address of vec2 into X2

LDR X4, [X1, 0] //Loads the first index of X1 into X4
LDR X5, [X2, 0] //Loads the first index of X2 into X5

MUL X6, X4, X5 //Calculates X4*X5 and stores the value in X6
MOV X3, X6 //Moves X6 into X3 to start the calculation of the final dot product

LDR X4, [X1, 8] //Loads the second index of X1 into X4
LDR X5, [X2, 8] //Loads the second index of X2 into X5

MUL X6, X4, X5 //Calculates X4*X5 and stores the value in X6
ADD X3, X6, X3 //Adds the Values of X6 and X3 and stores it back in X3 continuing the dot product calculation

LDR X4, [X1, 16] //Loads the third index of X1 into X4
LDR X5, [X2, 16] //Loads the third index of X2 into X5

MUL X6, X4, X5 //Calculates X4*X5 and stores the value in X6
ADD X3, X6, X3 //Completes the final dot product addition for the thrid index by adding X3 to X6 and putting the value back in X3

ADR X7, dot //Stores the address of dot into X7 to prep for data storage
STR X3, [X7] //Inputs the calculated dot product so the address of dot points to the value

MOV X0, 0 //Sets X0 to 0
MOV X8, 93 //Call for termination
SVC 0 //System Call

.data
	vec1: .quad 10, 20, 30
	vec2: .quad 1, 2, 3
	dot: .quad 0
