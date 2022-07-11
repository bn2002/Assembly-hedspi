# File: utils.asm
# Purpose: To define utilities which will be used in MIPS programs
# Author: Kann

# subprogram: PrintNewLine
# input: none
# output: none
# side effects: A new line character is printed to the user's console

.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra

.data
	__PNL_newline: .asciiz "\n"


.text
PrintInt:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	jal PrintNewLine
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	addi $v0, $zero, 4
	syscall
	move $a0, $a1
	
	li $v0, 1
	syscall
	
	
	jr $ra

.text
Exit:
	li $v0, 10
	syscall
