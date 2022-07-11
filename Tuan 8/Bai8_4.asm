.data
	prompt_miles: .asciiz "\nEnter the number of miles driven: "
	prompt_gallons: .asciiz "\nEnter the number of gallons used: "
	result: .asciiz "Your mpg = "
	
	miles: .space 4
	gallons: .space 4
	mpg: .space 4
	
.text
	# prompt miles
	la $a0, prompt_miles
	jal PromptInt
	sw $v0, miles
	
	# prompt gallons
	la $a0, prompt_gallons
	jal PromptInt
	sw $v0, gallons
	
	# load miles, load gallons and caculator mpg
	lw $t1, miles
	lw $t2, gallons
	div $t3, $t1, $t2
	
	sw $t3, mpg
	
	#Print result
	la $a0, result
	lw $a1, mpg
	jal PrintInt
	
	
	jal Exit
.include "utils.asm"