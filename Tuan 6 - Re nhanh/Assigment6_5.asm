.data
	test: .word 2
.text
	la $s0, test # load the address of test varible
	lw $s1, 0($s0) # load the value of test to register $t1
	#Init case
	li $t0, 0
	li $t1, 1
	li $t2, 2
	
	#Init a, b
	li $s2, 0
	li $s3, 0
	
	beq $s1, $t0, case_0
	beq $s1, $t1, case_1
	beq $s1, $t2, case_2
	j default

	
	case_0:
		addi $s2, $s2, 1 # a = a + 1
		j continue
	case_1:
		sub $s2, $s2, $t1 # a = a - 1
		j continue
	case_2:
		add $s3, $s3, $s3
		j continue

default:
continue:
	jal Exit
.include "utils.asm"
