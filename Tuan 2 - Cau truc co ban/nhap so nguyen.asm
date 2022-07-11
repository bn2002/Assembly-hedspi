.data
prompt: .ascii "Hay nhap vao mot so nguyen: "
output: .asciiz "\nBan da nhap vao so: "

.text
main:
	# Nhap so
	li $v0, 4
	la $a0, prompt
	syscall
	
	# doc so va luu vao $s0
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	
	# Output the text
	li $v0, 4
	la $a0, output
	syscall
	
	# Output the number
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Exit the program
	
	li $v0, 10
	syscall