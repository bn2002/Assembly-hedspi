.data
	input: .asciiz "\nEnter number: "
	isPrime: .asciiz "\nNumber n is prime"
	notPrime: .asciiz "\nNumber n is not prime"
	
.text
	la $a0, input
	jal PromptInt
	move $s1, $v0 # num
	
	beq $s1, 1, print_is_prime
	beq $s1, 2, print_is_prime
	
	div $s2, $s1, 2 # num = num / 2
	
	li  $t0, 2 # i = 3
	
	loop:
		
		rem $t1, $s1, $t0
		beqz $t1, print_is_not_prime
		addi $t0, $t0, 1
		blt $t0, $s2, loop
		b print_is_prime
	
	print_is_prime:
		la $a0, isPrime
		jal PrintString
		jal Exit
	
	print_is_not_prime:
		la $a0, notPrime
		jal PrintString
		jal Exit

	
.include "utils.asm"