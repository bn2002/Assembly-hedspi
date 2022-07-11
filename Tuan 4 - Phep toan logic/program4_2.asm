.data
	output1: .asciiz "\nPlease input a value: "
	output2: .asciiz "\n Input value: "
	output3: .asciiz "\n Result after first XOR: "
	output4: .asciiz "\nResult after the second XOR: "
	
.text
.globl main
main:
	#print message
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	#Read integer
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	#Print integer in hex
	ori $v0, $zero, 34
	move $a0, $s0
	syscall
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	
	#XOR lan 1
	xori $s0, $s0, 0xffffffff
	move $a0, $s0
	
	#Print integer in hex
	ori $v0, $zero, 34
	syscall
	
	#Print message
	ori $v0, $zero, 4
	la $a0, output4
	syscall
	
	xori $s0, $s0, 0xffffffff
	move $a0, $s0
	
	#Print integer in hex
	ori $v0, $zero, 34
	syscall
	
	#exit
	
	ori $v0, $zero, 10
	syscall
	
	
	