.data
	x: .space 1000	   # destination string x, empty
	y: .asciiz "Hello" # source string y
	
	output1: .asciiz "Tong cua "
	output2: .asciiz " + "
	output3: .asciiz " la: "
.text
strcpy:
	add $s0, $zero, $zero 	# s0 = i = 0
	la $a0, x 				# load address of x to $a0
	la $a1, y				# load address of y to $a1
	
L1:
	
	add $t1, $s0, $a1 		# t1 = s0 + a1 = i + y[0]
	
							# = address of y[i]
	lb $t2, 0($t1) 			# t2 = value at t1 = y[i]
	
	add $t3, $s0, $a0 		# t3 = s0 + a0 = i + x[0]
							# = address of x[i]
	
	sb $t2, 0($t3)			# x[i] = t2 = y[i]
	beq $t2, $zero, end_of_strcpy
	nop
	addi $s0, $s0, 1
	j L1
	nop

end_of_strcpy:
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, output2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, output3
	syscall
	
	add $t4, $s0, $s1
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	
	