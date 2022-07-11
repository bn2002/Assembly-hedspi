.data
input: .space 81
inputSize: .word 80
prompt: .asciiz "Hay nhap vap mot chuoi: "
output: .asciiz "\nBan da nhap vao chuoi: "


.text
main:
	# Prompt for the string to enter
	li $v0, 4
	la $a0, prompt
	syscall
	
	# REad the string
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	# Output the text
	li $v0, 4
	la $a0, output
	syscall
	
	# output the number
	li $v0, 4
	la $a0, input
	syscall
	
	#Exit the program
	li $v0, 10
	syscall