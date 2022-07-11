.data
	y: .word 0
	prompt: .asciiz "Enter a value for x: "
	result: .asciiz "The result is: "
.text  
.globl main
main:
	la $a0, prompt
	jal PromptInt
	nop
	move $s0, $v0
	
	li $t5, 5
	li $t6, 2
	li $t7, 3
	
	
	mul $t0, $s0, $s0
	mul $t0, $t0, $t5
	mul $t1, $s0, $t6
	add $t0, $t0, $t1
	add $s1, $t0, $t7
	
	la $a0, result
	move $a1, $s1
	jal PrintInt
	
	jal PrintNewLine
	nop
	jal Exit
	
	
.include "utils.asm"
