.data

.text
	# x: $t1
	li $s1, 10 # i
	li $s2, 5 # j
	start:
		add $s0, $s1, $a2 # i + j
		sle $t0, $s0, 0 # i + j <= 0
		beq $t0, $zero, else # branch to else if i + j > 0
		#if block code
		addi $t1, $t1, 1 # x = x + 1
		addi $t3, $zero, 1
		j endif
	else:
		addi $t2, $t2, -1
		add $t3, $t3, $t3
	endif:
		jal Exit
.include "utils.asm"