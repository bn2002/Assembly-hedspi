.text
main:
	li $a0, -45
	jal abs
	nop 
	add $s0, $zero, $v0
	jal Exit

endmain:

abs:
	
	bltz $a0, done
	add $v0, $a0, $zero
	nop
	jr $ra
done:
	sub $v0, $zero, $a0
	jr $ra

.include "utils.asm"
		