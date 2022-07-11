.text
main:

	la $a0, prompt
	
	jal PromptInt
	move $s0, $v0
	
	# print the value back to the user
	jal PrintNewLine
	
	la $a0, result
	#jal PrintString
	
	li $v0, 1
	move $a1, $s0
	jal PrintInt
	
	jal Exit

.data
	prompt: .asciiz "Please enter an integer: "
	result: .asciiz "You entered: "


.include "utils.asm"
