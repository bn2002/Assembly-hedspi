.data
	num: .word -1
	PositiveNumber: .asciiz "Number is positive"	
	NegativeNumber: .asciiz "Number is negative"
.text
	lw $t0, num
	sgt $t1, $t0, $zero
	beqz $t1, else
		la $a0, PositiveNumber
		jal PrintString
		b end_if
	else:
		la $a0, NegativeNumber
		jal PrintString
	end_if:
		jal Exit

.include "utils.asm"