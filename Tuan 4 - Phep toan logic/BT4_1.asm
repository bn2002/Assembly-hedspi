.data
	output1: .asciiz "\nInput a: "
	output2: .asciiz "\nInput b: "
	output_hexa_a: .asciiz "\nInput value of a: "
	output_hexa_b: .asciiz "\nInput value of b: "
	output3: .asciiz "\nResult a xor b: "
	output4: .asciiz "\nResult when double xor b: "
	
.text
.globl main
main:
	#Print message
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	#Read integer a
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	#Read integer b
	ori $v0, $zero, 5
	syscall
	move $s1, $v0
	
	#Print hexa of number a
	ori $v0, $zero, 4
	la $a0, output_hexa_a
	syscall
	
	ori $v0, $zero, 34
	move $a0, $s0
	syscall
	
	#Print hexa of number b
	ori $v0, $zero, 4
	la $a0, output_hexa_b
	syscall
	
	ori $v0, $zero, 34
	move $a0, $s1
	syscall
	
	#a XOR b and print result
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	
	xor $s2, $s0, $s1
	move $a0, $s2
	
	ori $v0, $zero, 34
	syscall
	
	#(a XOR b) XOR b and print result
	ori $v0, $zero, 4
	la $a0, output4
	syscall
	
	xor $s2, $s2, $s1
	move $a0, $s2
	
	ori $v0, $zero, 34
	syscall
	
	
	