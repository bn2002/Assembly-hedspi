.text
main:
	li $a0, 2
	li $a1, 15
	li $a2, -10
	jal max
	nop
	j exit
endmain:
max: 
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	add $v0, $a0, $zero		# copy (a0) in v0: largest so far
	sub $t0, $a1, $v0		# compute a1 - v0
	bltz $t0, okay			# if(a1) - (a0) < 0 then no change
	nop
	add $v0, $a1, $zero		# else a1 is largest thur far
okay:						
	sub $t0, $a2, $v0		# compute (a2) - (v0)
	bltz $t0, done			# if (a2) - (v0) < 0 then no change
	nop
	add $v0, $a2, $zero		# else (a2) is larges overall

done:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra					# return to calling program
exit:
	