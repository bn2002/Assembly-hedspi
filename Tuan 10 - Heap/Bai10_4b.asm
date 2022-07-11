.data

.text


# Subprogram: 	allocateArray
# Input: 		$a0 - the number of items in the array
#		 		
# Output:		$v0 - Address of the array allocated
AllocateArray:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	mul $a0, $a0, 8		## 8 byte moi phan tu
	li $v0, 9
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
