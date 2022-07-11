.data
	result1: .asciiz "\n first value = "
	result2: .asciiz "\nsecond value = "
.text
main:
	
	# Print result 1
	li $v0, 4
	la $a0, result1
	syscall
	
	# Print number 1: 4
	li $v0, 1
	li $a0, 4
	syscall
	
	# Print result 2
	li $v0, 4
	la $a0, result2
	syscall
	
	# Print number 2
	li $v0, 1
	li $a0, 8
	syscall
	
	# Exit
	addi $v0, $zero, 10
	syscall