.data
prompt: .asciiz "Enter your number: "
result: .asciiz "A result of 0 is even, 1 is odd: result = "

.text
.globl main


main:
	# Get input value
	addi $v0, $zero, 4
	la $a0, prompt
	syscall
	
	addi $v0, $zero, 5 # retrueve input
	syscall
	move $s0, $v0
	
	#Check if odd or even
	addi $t0, $zero, 2
	div $t0, $s0, $t0
	mfhi $s1
	
	#Print output
	addi $v0, $zero, 4
	la $a0, result
	syscall
	
	addi $v0, $zero, 1 #Print result
	move $a0, $s1
	syscall
	
	#Exit
	
	addi $v0, $zero, 10
	syscall
	