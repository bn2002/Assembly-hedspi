.data
	output1: .asciiz "\nPlease input an integer value: "
	output2: .asciiz "\nInput value in binary:\t\t"
	output3: .asciiz "\nResult after sll 4 bits:\t"
	output4: .asciiz "\nResult after sllv 4 bits:\t"
	output10: .asciiz "\nResult after srl 4 bits:\t"
	output11: .asciiz "\nResult after srlv 4 bits:\t"
	output5: .asciiz "\nInput value in binary:\t"
	output6: .asciiz "\nResult after sra 4 bits:\t"
	output7: .asciiz "\nResult after srav 4 bits:\t"
	output8: .asciiz "\nResult after rol 4 bits:\t"
	output9: .asciiz "\nResult after ror 4 bits:\t"
	
.text
.globl main
main:
	
	#Load shamt to $t8
	li $t8, 4
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	#Read Integer
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	
	#Print input value in binary

	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#Result after sll 4 bits
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	
	sll $t0, $s0, 4
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	#Result after sllv 4bits
	ori $v0, $zero, 4
	la $a0, output4
	syscall
	
	
	
	sllv $t0, $s0, $t8
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#Result afer srl 4 bits:
	ori $v0, $zero, 4
	la $a0, output10
	syscall
	
	srl $t0, $s0, 4
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	#Result afer srlv 4 bits:
	ori $v0, $zero, 4
	la $a0, output11
	syscall
	
	srlv $t0, $s0, $t8
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#Result after sra 4 bits:
	ori $v0, $zero, 4
	la $a0, output6
	syscall
	
	sra $t0, $s0, 4
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	#Result after srav 4 bits:
	ori $v0, $zero, 4
	la $a0, output7
	syscall
	
	srav $t0, $s0, $t8
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#Result after rol 4 bits:
	ori $v0, $zero, 4
	la $a0, output8
	syscall
	
	rol $t0, $s0, 4
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	#Result after ror 4 bits:
	ori $v0, $zero, 4
	la $a0, output9
	syscall
	
	ror $t0, $s0, 4
	
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
	
	
	#Exit
	ori $v0, $zero, 10
	syscall