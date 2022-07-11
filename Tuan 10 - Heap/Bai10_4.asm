.text
main:
	la $a0, prompt1
	li $a1, 80
	jal PromptString1
	move $a0, $v0
	jal PrintString
	
	la $a0, prompt2
	li $a1, 80
	jal PromptString1
	move $a0, $v0
	jal PrintString
	
	jal Exit
	
.data
	prompt1: .asciiz "Enter the first string: "
	prompt2: .asciiz "Enter the second string: "

.text
# Subprogram: PromptString
# Input: $a0 -  The prompt
#		 $a1 - the maximun of the string
# output: $v0 - The - address of the user enterd string
PromptString1:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	sw $s0, 8($sp)
	
	li $v0, 4		#Print the prompt in the function
	syscall
	
	li $v0, 9		# allocate memory
	lw $a0, 4($sp)
	syscall
	move $s0, $v0
	
	move $a0, $v0
	li $v0, 8		# Read the string
	lw $a1, 4($sp)
	syscall
	
	move $v0, $a0
	lw $ra, 0($sp)
	lw $s0, 8($sp)
	addi $sp, $sp, 12
	jr $ra

.include "utils.asm"
	
