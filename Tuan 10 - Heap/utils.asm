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

# subprogram: PrintTab
.text 
PrintTab:
	li $v0, 4
	la $a0, tab
	syscall
	jr $ra
.data
	tab: .asciiz "\t"		
# subprogram: PrintString
# input: $a0: The address of the string to the console
# output: none
# side effects: The String is printed to the user's console

.text
PrintString:
	addi $v0, $zero, 4
	syscall
	jr $ra

# subprogram: PrintInt
# input: $a0: The address of the string to the console
#		 $a1: The value of the int to print
# output: none
# side effects: The String is printed follwed by the integer value

.text
PrintInt:
	addi $v0, $zero, 4
	syscall
	move $a0, $a1
	li $v0, 1
	syscall
	
	jr $ra

# subprogram: PromptString
# input: $a0: Dia chi buffer
#		 $a1: Chieu dai chuoi
# return: $v0 - 

.text
PromptString:

	#Read the integer value
	li $v0, 8
	syscall
	jr $ra


# subprogram: PromptInt
# input: $a0: The address of the string to the console
# return: $v0 - The value the user entered
# side effects: The String is printed follwed by the integer value

.text
PromptInt:
	# Print the prompt, which is already in $a0
	li $v0, 4
	syscall
	
	#Read the integer value
	li $v0, 5
	syscall
	jr $ra

# subprogram: Exit
# input: none
# return: none
# side effects: Exit program

.text
Exit:
	li $v0, 10
	syscall
