.data
	output1: .asciiz "\nPlease input a character: "
	output2: .asciiz "\nUppercase to lowercase: result when adding with 0x20: "
	output3: .asciiz "\nUppercase to lowercase: result when oring with 0x20: "
	
.text
.globl main

main:
	#Print message
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	#Read character
	ori $v0, $zero, 12
	syscall
	move $s0, $v0
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	#Uppsercase by adding with 0x20 and print result
	or $t0, $s0, $zero
	addi $a0, $t0, 0x20
	ori $v0, $zero, 11
	syscall
	
	#print message
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	
	#Print character
	ori $a0, $s0, 0x20
	ori $v0, $zero, 11
	syscall
	
	#Exit
	ori $v0, $zero, 10
	syscall