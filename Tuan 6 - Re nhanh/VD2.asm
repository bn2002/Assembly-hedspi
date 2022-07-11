.data
	x: .word 2
	EvenNumber: .asciiz "Even Number"


.text
	lw $t0, x
	slt $t1, $zero, $t0
	rem $t2, $t0, 2
	not $t2, $t2
	and $t3, $t1, $t2
	bne $t3, 1, end_if
		la $a0, EvenNumber
		jal PrintString
	end_if:
		jal Exit


.include "utils.asm"