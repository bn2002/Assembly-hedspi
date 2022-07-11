.text
	
	# Read integer
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# Validate input
	blt $s0, 0, input_error # if $s0 < 0
	bgt $s0, 15, input_error # if $s0 > 15
	
	# Save the base of the array to $s1
	la $s1, array_base
	
	# Address of next array element
	mul $t0, $s0, 4	
	add $t1, $s1, $t0		# Address = base of the array * number user input
	
	
	la $a0, output
	jal PrintString
	
	move $a0, $t1
	jal PrintString
	
	j Exit
	
	


input_error:
	la $a0, error
	jal PrintString
	j Exit
.data
	prompt: .asciiz "\nEnter a number from 0 to 15: "
	output: .asciiz "\nTour number is: "
	error: .asciiz "\nError: Number from 0 to 15"
.align 2
	array_base:
		.asciiz "0x0"
		.asciiz "0x1"
		.asciiz "0x2"
		.asciiz "0x3"
		.asciiz "0x4"
		.asciiz "0x5"
		.asciiz "0x6"
		.asciiz "0x7"
		.asciiz "0x8"
		.asciiz "0x9"
		.asciiz "0xa"
		.asciiz "0xb"
		.asciiz "0xc"
		.asciiz "0xd"
		.asciiz "0xe"
		.asciiz "0xf"

.include "utils.asm"