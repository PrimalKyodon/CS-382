/*******************************************************************************
 * Author  : Aaren Patel
 * Date    : October 3, 2023
 * Pledge  : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

.text
.global _start
.extern scanf

_start:
    
    ADR   X0, fmt_str   // Load address of formated string
    ADR   X1, left      // Load &left
    ADR   X2, right     // Load &right
    ADR   X3, target    // Load &target
    BL    scanf         // scanf("%ld %ld %ld", &left, &right, &target);

    ADR   X1, left      // Load &left
    LDR   X1, [X1]      // Store left in X1
    ADR   X2, right     // Load &right
    LDR   X2, [X2]      // Store right in X2
    ADR   X3, target    // Load &target
    LDR   X3, [X3]      // Store target in X3

    /* Your code here */
	SUB X3, X3, X1
	CMP X3, #0
	B.LE L1

	SUB X2, X2, X1
	CMP X3, X2
	B.LE L2

L1:	ADR X1, no
	ADR X2, len_no
	B L3

L2: ADR X1, yes
	ADR X2, len_yes

L3:	LDR X2, [X2]
	MOV X0, 1
	MOV X8, 64
	SVC 0

exit:
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld%ld%ld"
    yes:     .string   "Target is in range\n"
    len_yes: .quad     . - yes  // Calculate the length of string yes
    no:      .string   "Target is not in range\n"
    len_no:  .quad     . - no   // Calculate the length of string no
