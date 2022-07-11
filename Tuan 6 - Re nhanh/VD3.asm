.data
	x: .word 8
	Output: .asciiz "number is 0 < x < 10 and even"
.text
	
	lw $t0, x
	sgt $t1, $t0, $zero
	slti $t2, $t0, 10
	rem $t3, $t0, 2
	not $t3, $t3
	and $t1, $t1, $t2
	and $t1, $t1, $t3
	
	bne $t1, 1, end_if
		la $a0, Output
		jal PrintString
	
	end_if:
		jal Exit

.include "utils.asm"