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


# subprogram: PrintNumberInBinary
# input: $a0 - Địa chỉ của nội dung cần in ra màn hình 
#		 $a1 - Số nguyên cần in ở dạng binary 
# output: So nguyen o dang binary

.text
PrintNumberInBinary:
	ori $v0, $zero, 4
	syscall
	
	move $a0, $a1
	ori $v0, $zero, 35
	syscall
	jr $ra
# subprogram: NOR
# input: $a0 -  Chuoi bit thu nhat
#		 $a1 - Chuoi bit thu hai
# return: $v0 - Ket qua khi thuc hien phep nor $a0 $a1

.text 	
NOR:
	nor $v0, $a0, $a1
	jr $ra
	
#	subprogram: NAND
#	input: $a0 - Chuoi bit thu nhat
#		   $a1 - Chuoi bit thu hai		   
#return $v0 - Ket qua phep NAND

.text
NAND:
	and $v0, $a0, $a1
	not $v0, $v0
	jr $ra
	
#	subprogram: NOT
#	input: $a0 - Chuoi bit can dao nguoc
#return $v0 - Ket qua phep NOT

.text
NOT:
	not $v0, $a0
	jr $ra

#	subprogram: Mult4
#	input: $a0 - So can nhan 4
#	return $v0 - Ket qua phep Nhan voi 4

.text
Mult4:
	sll $v0, $a0, 2
	add $v0, $v0, $zero
	jr $ra
#	subprogram: Mult10
#	input: $a0 - So can nhan 10
#	return $v0 - Ket qua phep Nhan voi 10
.text
Mult10:
	sll $v0, $a0, 3
	sll $v1, $a0, 1
	add $v0, $v0, $v1
	jr $ra
	
#	subprogram: Hoan Doi
#	input: $a0 - So thu nhat
#		   $a1 - So thu hai
#	return $v0 - So thu nhat
#		   $v1 - So thu hai

.text
HoanDoi:
	# Doi so thu hai cho so thu nhat
	xor $v0, $a0, $a1
	xor $a0, $v0, $a0
	
	xor $a1, $v0, $a1
	
	jr $ra

#	subprogram: RightCircularShift
#	input: $a0 - Chuoi bit can dich vong phai
#	return $v0 - Ket qua sau khi dich 1 bit
#		   $v1 - 

.text
RightCircularShift:
	# Doi so thu hai cho so thu nhat
	ror $v0, $a0, 1
	
	jr $ra
	
# subprogram: Exit
# input: none
# return: none
# side effects: Exit program

.text
Exit:
	li $v0, 10
	syscall
