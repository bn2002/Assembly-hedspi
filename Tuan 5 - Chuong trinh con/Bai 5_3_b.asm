.text
	
	la $a0, buffer
	
	ori $a1, $zero, 4
	jal PromptString
	
	
	
	jal ToUpper
	
	jal Exit

.data
 	buffer: .space 4
	output1: .asciiz "Nhap vao chuoi: "	
	
.include "utils.asm"
