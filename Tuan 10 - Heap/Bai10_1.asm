.text
.globl main
main:
	la $a0, array_base
	lw $a1, array_size
	
	jal PrintIntArray
	jal Exit

.data
	array_size: .word 5
	array_base:
		.word 12
		.word 7
		.word 3
		.word 5
		.word 11

.text
# Subprogram: PrintIntArray
# input:		$a0 - The base addrest of the array
#				$a1 - The size of the array

PrintIntArray:
	addi $sp, $sp, -16		# Stack record
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0			# save the base of the array to $s0
	
	# inittialzation for counter loop
	# $s1: is the ending index of the loop
	# $s2: is the loop counter
	
	move $s1, $zero 
	addi $s2, $a1, -1 	  # position = number array - 1
	
	la $a0, open_bracket
	jal PrintString
	
loop:
	# check ending condition
	slt $t0, $s2, $s1
	bnez $t0, end_loop
		
		sll $t0, $s2, 2		# Mutiple the loop counter by 4 to get offset of array
		add $t0, $t0, $s0	# address of next array element
		lw $a1, 0($t0)		# Next array element
		la $a0, comma		
		jal PrintInt		# print the integer from array
		
		addi $s2, $s2, -1	# increament $s0
		b loop

end_loop:
	li $v0, 4	# print close bracket
	la $a0, close_bracket
	syscall
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra


.data
	open_bracket: .asciiz "["
	close_bracket: .asciiz "]"
	comma: .asciiz ","

.include "utils.asm"
		